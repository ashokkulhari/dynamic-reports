package com.mpgovcrm.account.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mpgovcrm.account.model.DReportDes;
import com.mpgovcrm.account.model.DReportModel;
import com.mpgovcrm.account.model.District;
import com.mpgovcrm.account.model.ReportM;
import com.mpgovcrm.account.model.ReportMTotalVo;
import com.mpgovcrm.account.model.ReportMVo;
import com.mpgovcrm.account.model.ReportNames;
import com.mpgovcrm.account.model.Role;
import com.mpgovcrm.account.model.SearchVo;
import com.mpgovcrm.account.repository.ReportCustomRepository;
import com.mpgovcrm.account.service.DistrictService;
import com.mpgovcrm.account.service.ReportService;
import com.mpgovcrm.account.service.UserService;
import com.mpgovcrm.account.utils.CommonUtil;

import org.springframework.security.core.userdetails.User;


@Controller
public class ReportController {

	 @Autowired
	private UserService userService;
	@Autowired
	private DistrictService districtService;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	ReportCustomRepository reportCustomRepository;
	
	
	@RequestMapping(value = "/report1", method = RequestMethod.GET)
    public String report1(Model model) {
        model.addAttribute("report1data", "तहसील");

        return "report1";
    }
	
	@RequestMapping(value = "/dynamicreport", method = RequestMethod.POST)
    public ModelAndView processDynamicReport(@ModelAttribute DReportModel dm) {
		System.out.println("..processDynamicReport..");
		ModelAndView mv = new ModelAndView("dynamicreport");
		mv.addObject("title", "Dynamic Report");
//		List<DReportDes> dreportlist =dm.getDreportlist();
//		for (int i = 0; i < dreportlist.size(); i++) {
//			DReportDes d   = dreportlist.get(i);
//			System.out.println(d.getColDesc() + "  value =" +d.getColNameVal());
//			
//		}
		
		
		mv.addObject("dlistmodel",dm);
        return mv;
	}
	
	@RequestMapping(value = "/dynamicreport", method = RequestMethod.GET)
    public ModelAndView dynamicReport() {
		
		ModelAndView mv = new ModelAndView("dynamicreport");
		mv.addObject("title", "Dynamic Report");
		DReportModel dm = new DReportModel();
//		DReportDes d = new DReportDes();
//		d.setColDesc("दिनांक 1-4-2013 को बकाया");
//		d.setColName("remApr");
//		dm.add(d);
//		d = new DReportDes();
//		d.setColDesc("दिनांक 1-4-2013 से प्रतिवेदित माह तक नई मांग");
//		d.setColName("newDmdTLApr");
//		dm.add(d);
//		d = new DReportDes();
//		d.setColDesc("कुल वसूली हेतु राशि (3+4)");
//		d.setColName("totalRecApr");
//		d.setColNameA("remApr");
//		d.setColNameB("newDmdTLApr");
//		d.setOperation("add");
//		dm.add(d);
		
		mv.addObject("dlistmodel",dm);
        return mv;
    }
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView searchReport()
    {System.out.println("Simple search");
    	SearchVo searchVo = new SearchVo();
    	searchVo.setReportNames(reportService.findReportNames());
    	ModelAndView mv = new ModelAndView("search");
    	mv.addObject("title", "Search");
    	mv.addObject("searchvo", searchVo);
        return mv;
    }
	
	@RequestMapping(value = "/searchmain", method = RequestMethod.GET)
    public ModelAndView searchMainReport()
    {System.out.println("Main search");
    	SearchVo searchVo = new SearchVo();
    	Map<String , String> list = new HashMap<>();
    	list.put("mreport1", "Main Report1");
    	list.put("mreport2", "Main Report2");
    	searchVo.setMainReportNames(list);
        ModelAndView mv = new ModelAndView("searchmain");
    	mv.addObject("title", "Main Search");
    	mv.addObject("searchvo", searchVo);
        return mv;
    }
	
	
	@RequestMapping(value = "/searchsubreport", method = RequestMethod.POST)
    public ModelAndView processSearch(@ModelAttribute SearchVo vo) {
		System.out.println("search post..name ="+vo.getReportName()+" month "+vo.getMonth()  +"  year ="+vo.getYear());
		 User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      String name = user.getUsername(); //get logged in username
	      
	      System.out.println("Current user = "+name);
	      com.mpgovcrm.account.model.User u = userService.findByUsername(name);
	      Set<Role> s =u.getRoles();
	      Iterator<Role> setIterator = s.iterator();
	        while(setIterator.hasNext()){
	        	Role r =setIterator.next();
	            System.out.println(r.getName());
	        }
	        List<com.mpgovcrm.account.model.User>  ulist=null;
	        if(name.startsWith("admin") ){
	        	ulist = userService.findAll();
	        }else{
	        	ulist = new ArrayList<>();
	        	ulist.add(u);
	        }
	        System.out.println("ulist ="+ulist);
	        ReportMTotalVo reportMTotalVo  = new ReportMTotalVo();
	        
	    	 Double remAprTT=0.0, newDmdTLAprTT=0.0, totalRecAprTT=0.0,remCurrentTT=0.0,
	    	newDmdCurrentTT=0.0,totalRecCurrentTT=0.0,recLastYrTillTT=0.0,remLastYrTillTT=0.0,newDmd_Last_YrTillTT=0.0,totalRecTT=0.0;
			
	        List<ReportMVo> reportMs= new ArrayList<>();
	        for (int i = 0; i < ulist.size(); i++) {
	        	
	        	com.mpgovcrm.account.model.User us = ulist.get(i);
	        	if(!us.getUsername().startsWith("admin") ){
	             	ReportMVo rm = new ReportMVo();
		        	
		        	rm.setUserName(us.getUserDisplayName()+" - "+ us.getDesignation());
		        	rm.setUserId(us.getId());
		        	District d =districtService.findById(us.getDistrict_id()) ;
					rm.setLocation(d.getDiscription());
					ReportM reportM = reportService.findByUserId(us.getId());
					System.out.println("reportM  = "+reportM +"   getUserName  "+rm.getUserName());
					if(reportM!=null){
						
						rm.setRemApr(reportM.getRemApr());
						remAprTT=remAprTT+reportM.getRemApr();
						
						rm.setNewDmdTLApr(reportM.getNewDmdTLApr());
						newDmdTLAprTT =newDmdTLAprTT+reportM.getNewDmdTLApr();
						
						rm.setTotalRecApr(reportM.getTotalRecApr());
						totalRecAprTT=totalRecAprTT+reportM.getTotalRecApr();
						
						rm.setRemCurrent(reportM.getRemCurrent());
						remCurrentTT=remCurrentTT+reportM.getRemCurrent();
						
						rm.setNewDmdCurrent(reportM.getNewDmdCurrent());
						newDmdCurrentTT=newDmdCurrentTT+reportM.getNewDmdCurrent();
						
						rm.setTotalRecCurrent(reportM.getTotalRecCurrent());
						totalRecCurrentTT=totalRecCurrentTT+reportM.getTotalRecCurrent();
						
						rm.setRecLastYrTill(reportM.getRecLastYrTill());
						recLastYrTillTT=recLastYrTillTT+reportM.getRecLastYrTill();
						
						rm.setRemLastYrTill(reportM.getRemLastYrTill());
						remLastYrTillTT=remLastYrTillTT+reportM.getRemLastYrTill();
						
						rm.setNewDmd_Last_YrTill(reportM.getNewDmd_Last_YrTill());
						newDmd_Last_YrTillTT =newDmd_Last_YrTillTT +reportM.getNewDmd_Last_YrTill() ; 
						rm.setTotalRec(reportM.getTotalRec());
						totalRecTT=totalRecTT+reportM.getTotalRec();
					}
					reportMs.add(rm);
	        	}
	   
			}
	        reportMTotalVo.setReportMVos(reportMs);
	        
	        reportMTotalVo.setRemAprTT(remAprTT);
	        reportMTotalVo.setNewDmdTLAprTT(newDmdTLAprTT);
	        reportMTotalVo.setTotalRecAprTT(totalRecAprTT);
	        reportMTotalVo.setRemCurrentTT(remCurrentTT);
	        reportMTotalVo.setNewDmdCurrentTT(newDmdCurrentTT);
	        reportMTotalVo.setTotalRecCurrentTT(totalRecCurrentTT);
	        reportMTotalVo.setRecLastYrTillTT(recLastYrTillTT);
	        reportMTotalVo.setRemLastYrTillTT(remLastYrTillTT);
	        
	        reportMTotalVo.setNewDmd_Last_YrTillTT(newDmd_Last_YrTillTT);
	        
	        reportMTotalVo.setTotalRecTT(totalRecTT);
	        
	        reportMTotalVo.setMonthName(CommonUtil.getMonthName(Integer.parseInt(vo.getMonth())));
	        reportMTotalVo.setMonth(Integer.parseInt(vo.getMonth()));
	        reportMTotalVo.setYear(Integer.parseInt(vo.getYear()));
	        ReportNames rname  = reportService.findByReportName(vo.getReportName());
	        reportMTotalVo.setReportDesc(rname.getDiscription());
	        reportMTotalVo.setReportName(rname.getReportName());
	        
	        ModelAndView mv = new ModelAndView("report1");
	    	mv.addObject("title", "Sub Report");
	    	mv.addObject("reportms", reportMTotalVo);
	    	
	    	
         return  mv;
    }
	
	
	@RequestMapping(value = "/processmainreport", method = RequestMethod.POST)
    public ModelAndView processMainSearch(@ModelAttribute SearchVo vo) {
		System.out.println("processmainreport post..name ="+vo.getReportName()+" month "+vo.getMonth()  +"  year ="+vo.getYear());
	        
	        List<ReportMTotalVo> ls2= reportCustomRepository.findMainReport();
	        for (int i = 0; i < ls2.size(); i++) {
	        	ReportMTotalVo r = ls2.get(i);
	        	System.out.println("TT  getRemAprTT   ="+r.getRemAprTT());
			}
	        
	        
         return  new ModelAndView("mainreport", "reportmtotals", ls2);
    }
	
	@RequestMapping(value = "/report2", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView processReport( @ModelAttribute ReportMVo vo) {
		System.out.println("username ="+vo.getUserName()  +"  location= "+vo.getUserId() +"   "+vo.getMonth() +"  getReportName ="+ vo.getReportName());
		ReportM rm = reportService.findByUserId(vo.getUserId());
		if(rm== null){
			rm  = new ReportM();
			rm.setUserId(vo.getUserId());
		}

		if(vo.getRemApr()!=null){
			rm.setRemApr(vo.getRemApr());
		}else{
			rm.setRemApr(0.0);
		}
		
		if(vo.getNewDmdTLApr()!=null){
			rm.setNewDmdTLApr(vo.getNewDmdTLApr());
		}else{
			rm.setNewDmdTLApr(0.0);
		}
		
		if(vo.getTotalRecApr()!=null){
			rm.setTotalRecApr(vo.getTotalRecApr());
		}else{
			rm.setTotalRecApr(0.0);
		}
		if(vo.getRemCurrent()!=null){
			rm.setRemCurrent(vo.getRemCurrent());
		}else{
			rm.setRemCurrent(0.0);
		}
		
		if(vo.getNewDmdCurrent()!=null){
			rm.setNewDmdCurrent(vo.getNewDmdCurrent());
		}else{
			rm.setNewDmdCurrent(0.0);
		}
		if(vo.getTotalRecCurrent()!=null){
			rm.setTotalRecCurrent(vo.getTotalRecCurrent());
		}else{
			rm.setTotalRecCurrent(0.0);
		}
		if(vo.getRecLastYrTill()!=null){
			rm.setRecLastYrTill(vo.getRecLastYrTill());
		}else{
			rm.setRecLastYrTill(0.0);
		}
		
		if(vo.getRemLastYrTill()!=null){
			rm.setRemLastYrTill(vo.getRemLastYrTill());
		}else{
			rm.setRemLastYrTill(0.0);
		}
		if(vo.getNewDmd_Last_YrTill()!=null){
			rm.setNewDmd_Last_YrTill(vo.getNewDmd_Last_YrTill());
		}else{
			rm.setNewDmd_Last_YrTill(0.0);
		}
		if(vo.getTotalRec()!=null){
			rm.setTotalRec(vo.getTotalRec());
		}else{
			rm.setTotalRec(0.0);
		}
		
		rm.setMonth(vo.getMonth());
		rm.setYear(vo.getYear());
		if(vo.getReportName()!=null){
			rm.setReportName(vo.getReportName());
		}else{
			rm.setReportName("");
		}
		
		System.out.println("getTotalRecApr  ---"+rm.getTotalRecApr() +" ,vo.getNewDmd_Last_YrTill() = "+vo.getNewDmd_Last_YrTill()  +" ,vo.getNewDmdCurrent() = "+vo.getNewDmdCurrent() +"  vo.getRemLastYrTill() = "+vo.getRemLastYrTill());
		 reportService.save(rm);
		System.out.println("..saved ..."+rm.getUserId());
		 return  new ModelAndView("search", "searchvo", new SearchVo());
	}
}
