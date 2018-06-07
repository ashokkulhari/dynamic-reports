package com.mpgovcrm.account.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mpgovcrm.account.model.Contact;
import com.mpgovcrm.account.model.ContactForm;
import com.mpgovcrm.account.model.DReportDes;
import com.mpgovcrm.account.model.DReportModel;

@Controller
public class ContactController {

	
	

	
	@RequestMapping(value = "/dr-template-p1-get", method = RequestMethod.GET)
	public ModelAndView designTemplateP1Get() {
		ModelAndView mv = new ModelAndView("dr-template-p1-get");
		mv.addObject("title", "Report Template Page1");
		mv.addObject("contactForm", new ContactForm());

		return mv;
	}
	@RequestMapping(value = "/addCol", method = RequestMethod.POST)
	public ModelAndView addNewCol(@ModelAttribute("contactForm") ContactForm contactForm,@RequestParam String action) {
		System.out.println("addNewCol  = "+contactForm  +"  action =" +action);
		
		ModelAndView mv =null;
		if(action.equals("addnew")){
			 mv = new ModelAndView("dr-template-p1-get");
				mv.addObject("title", "Report Template Page1");
				
				List<Contact>  contacts = contactForm.getContacts();
				System.out.println("contacts   = "+contacts);
				if(contacts==null){
					contacts =new ArrayList<Contact>();
				}else{
					Contact c  = contacts.get(0);
					System.out.println("col name   = " + c.getColName());
				}
				System.out.println("Setting colName "+contacts.size());
				Contact c  = new Contact();
				c.setColName("col"+contacts.size());
				contacts.add(c);
				contactForm.setContacts(contacts);
		}else if(action.equals("next")){
			mv = new ModelAndView("dr-template-p2-get");
			mv.addObject("title", "Report Template Page2");
		}
		
		
		mv.addObject("contactForm", contactForm);
		return mv;
	}	
	
	@RequestMapping(value = "/savetemplate", method = RequestMethod.POST)
	public ModelAndView saveTemplate(@ModelAttribute("contactForm") ContactForm contactForm ) {
		System.out.println("addNewCol  = "+contactForm.getReportName() +"  action =" +contactForm.getReportNameDesc());
		ModelAndView mv = new ModelAndView("dr-template-p1-get");
		mv.addObject("title", "Report Template Page1");
		
		
		List<Contact>  contacts = contactForm.getContacts();
		System.out.println("contacts   = "+contacts);
		if(contacts==null){
			contacts =new ArrayList<Contact>();
		}else{
			Contact c  = contacts.get(0);
			System.out.println("col name   = " + c.getColName());
		}
		System.out.println("Setting colName "+contacts.size());
		Contact c  = new Contact();
		c.setColName("col"+contacts.size());
		contacts.add(c);
		contactForm.setContacts(contacts);
		mv.addObject("contactForm", contactForm);
		return mv;
	}	
	
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public ModelAndView get() {
		List<ContactForm> cfs = new ArrayList();
		for (int i = 0; i < 2; i++) {
			 List<Contact> contacts = new ArrayList<Contact>();
				
			 Contact  c = new Contact();
				c.setColDesc("दिनांक 1-4-2013 को बकाया");
				c.setColName("remApr");
				contacts.add(c);
				c = new Contact();
				c.setColDesc("दिनांक 1-4-2013 से प्रतिवेदित माह तक नई मांग");
				c.setColName("newDmdTLApr");
				contacts.add(c);
				c = new Contact();
				c.setColDesc("कुल वसूली हेतु राशि (3+4)");
				c.setColName("totalRecApr");
				c.setColNameA("remApr");
				c.setColNameB("newDmdTLApr");
				c.setOperation("add");
				contacts.add(c);
			ContactForm contactForm = new ContactForm();
			contactForm.setContacts(contacts);
			cfs.add(contactForm);
		}
		DReportModel  drm = new DReportModel();
		drm.setContacts(cfs.get(0).getContacts());
		drm.setConactForms(cfs);
		return new ModelAndView("dynamicreport" , "contactForm", drm);
	}
	
	
	
//	@RequestMapping(value = "/save", method = RequestMethod.POST)
//	public ModelAndView save(@RequestBody MultiValueMap<String,ContactForm> formData) {
//		System.out.println(formData);
//		for (Iterator iterator = formData.keySet().iterator(); iterator.hasNext();) {
//			String key = (String) iterator.next();
//			List<ContactForm> cfs = formData.get(key);
//			System.out.println("cfs  "+cfs);
//			for (int i = 0; i < cfs.size(); i++) {
//				ContactForm cf = cfs.get(i);
//				for (int j = 0; j < cf.getContacts().size(); j++) {
//					Contact c = cf.getContacts().get(j);
//					System.out.println(c.getColName()+ "   ColDesc = "+c.getColDesc()+"   val = "+c.getColNameVal());
//				}
//			}
//		}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("contactForm") DReportModel contactForm) {
		System.out.println(contactForm);
		System.out.println(contactForm.getConactForms());
//		System.out.println("forms :" + contactForm.getConactForms());
		List<ContactForm>  cfs  = contactForm.getConactForms();
		for (int i = 0; i < cfs.size(); i++) {
			List<Contact> contacts = cfs.get(i).getContacts();
			List<Contact> outcontacts = new ArrayList<Contact>();
			Map<String , Contact >  mapping = new HashMap<>();
			for (int j = 0; j < contacts.size(); j++) {
				Contact c = contacts.get(j);
				System.out.printf("%s \t %s \n", c.getColDesc(), c.getColNameVal());
				mapping.put(c.getColName(), c);
				System.out.println("c.getOperation() = "+c.getOperation());
				if(c.getOperation()!=null && !"".equals(c.getOperation().trim())){
					String opr = c.getOperation() ;
					if(opr.equals("add")){
						Contact cA = mapping.get(c.getColNameA());
						Contact cB = mapping.get(c.getColNameB());
						double sum = Double.parseDouble(cA.getColNameVal()) +Double.parseDouble(cB.getColNameVal());
						c.setColNameVal(""+sum);
					}
				}else{
					System.out.println("operation is null or empty ..");
				}
				
				outcontacts.add(c);
			}
			contactForm.setContacts(outcontacts);
		}
		
		
		return new ModelAndView("dynamicreport", "contactForm", contactForm);
	}
}
