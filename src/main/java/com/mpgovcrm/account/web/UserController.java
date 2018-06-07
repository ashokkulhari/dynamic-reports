package com.mpgovcrm.account.web;

import com.mpgovcrm.account.model.Role;
import com.mpgovcrm.account.model.User;
import com.mpgovcrm.account.model.UserForm;
import com.mpgovcrm.account.service.DistrictService;
import com.mpgovcrm.account.service.SecurityService;
import com.mpgovcrm.account.service.UserService;
import com.mpgovcrm.account.validator.UserValidator;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
	private DistrictService districtService;
    
    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
    	System.out.println("...login  .is called ..");
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/" ,"/home" ,"/index"})
    public ModelAndView index() {
    	System.out.println("...index  .is called ..");
    	ModelAndView mv = new ModelAndView("index");
    	mv.addObject("title", "Home");
        return mv;
    }
    
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public ModelAndView home(HttpSession session ,Model model) {
    	System.out.println("...home  .is called ..");
    	ModelAndView mv = new ModelAndView("home");
    	mv.addObject("title", "Home");
    	org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      String name = user.getUsername(); //get logged in username
	      
	      System.out.println("Current user = "+name);
	      com.mpgovcrm.account.model.User u = userService.findByUsername(name);
	      Set<Role> s =u.getRoles();
	      Iterator<Role> setIterator = s.iterator();
	        while(setIterator.hasNext()){
	        	Role r =setIterator.next();
	            System.out.println(r.getName());
	            mv.addObject("rolename", r.getName());
	            session.setAttribute("rolename", r.getName());
	        }
        return mv;
    }
    
    @RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		// Invalidates HTTP Session, then unbinds any objects bound to it.
	    // Removes the authentication from securitycontext 		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		
		return "redirect:/login";
	}

    @RequestMapping(value = {"/usermanagement/adduser"}, method = RequestMethod.GET)
    public ModelAndView adduser() {
    	System.out.println("...userManagement  .is called ..");
    	ModelAndView mv = new ModelAndView("adduser");
    	
    	UserForm uf = new UserForm();
    	uf.setUser(new User());
    	uf.setDistricts(districtService.findAll());
    	mv.addObject("userForm", uf);
    	mv.addObject("title", "Add User");
        return mv;
    }
   
    @RequestMapping(value = "/usermanagement/adduser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("userForm") UserForm userForm, BindingResult bindingResult, Model model) {
    	
    	System.out.println("...addUser..POSt....");
    	User user =userForm.getUser();
       customValidate(bindingResult, user);
        if (bindingResult.hasErrors()) {
            return "adduser";
        }
        System.out.println("username = "+userForm.getUser().getUsername());
        System.out.println("District_id = "+userForm.getUser().getDistrict_id());
        
        System.out.println("getDesignation = "+userForm.getUser().getDesignation());
        
        userService.saveCustomer(userForm.getUser());
//        userService.saveUser(userForm.getUser().getDesignation() ,userForm.getUser().getDistrict_id(),userForm.getUser().getPassword() , userForm.getUser().getUserDisplayName(),userForm.getUser().getUsername() );


        return "redirect:/home";
    }
    
    @RequestMapping(value = {"/usermanagement/updateuser"}, method = RequestMethod.GET)
    public ModelAndView updateUser() {
    	System.out.println("...userManagement  updateuser .is called ..");
    	ModelAndView mv = new ModelAndView("updateuser");
    	mv.addObject("title", "Update User");
    	UserForm uf = new UserForm();
    	uf.setUsers(userService.findAll());
    	uf.setUser(new User());
    	uf.setDistricts(districtService.findAll());
    	mv.addObject("userForm", uf);
        return mv;
    }

    @RequestMapping(value = "/usermanagement/updateuser", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("userForm") UserForm userForm, BindingResult bindingResult, Model model) {
    	System.out.println("...updateuser..POSt....");
    	User user =userForm.getUser();
    	 System.out.println("username = "+userForm.getUser().getUsername() +"   roles "+userForm.getUser().getRoles());
         System.out.println("District_id = "+userForm.getUser().getDistrict_id());
         System.out.println("District_id = "+userForm.getUser().getPassword());
         System.out.println("getDesignation = "+userForm.getUser().getDesignation());
    	
    	
        if (!validatePassword(user)) {
            return "updateuser";
        }
       
        
        userService.saveCustomer(userForm.getUser());
//        userService.saveUser(userForm.getUser().getDesignation() ,userForm.getUser().getDistrict_id(),userForm.getUser().getPassword() , userForm.getUser().getUserDisplayName(),userForm.getUser().getUsername() );


        return "redirect:/home";
    }

	public boolean customValidate(BindingResult bindingResult, User user) {
		if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
			return false;
        }
        if (userService.findByUsername(user.getUsername()) != null) {
        	return false;
        }

        return validatePassword(user);
	}

	public boolean validatePassword(User user) {
		if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
			System.out.println("getPassword().length()  Size.userForm.password ");
        	return false;
        }

        if (!user.getPasswordConfirm().equals(user.getPassword())) {
        	System.out.println("getPasswordConfirm");
        	return false;
        }
        
        return true;
	}
}
