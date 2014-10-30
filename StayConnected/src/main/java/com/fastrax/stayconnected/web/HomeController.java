package com.fastrax.stayconnected.web;

import java.security.Principal;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.springframework.security.authentication.AnonymousAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	private String loginId;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
	public String home(Principal principal, Model model) {
		logger.info("login ID via Controller is: "+ principal.getName());
		//logger.info("login ID via AuthenticationContext is: "+ getLoginId());
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value="login_error", defaultValue="f") String failed, Model model) {
		if (failed.equalsIgnoreCase("t")) {
			model.addAttribute("error_message", "Incorrect username and/or password");
		}
		return "login";
	}

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		logger.info("login ID is", loginId);
		return "welcome";
	}
	@RequestMapping(value = "/adminonly", method = RequestMethod.GET)
	public String home3(Locale locale, Model model) {
		return "welcome";
	}
	@RequestMapping(value = "/admindba", method = RequestMethod.GET)
	public String home4(Locale locale, Model model) {
		return "welcome";
	}
	@RequestMapping(value = "/dbaonly", method = RequestMethod.GET)
	public String home5(Locale locale, Model model) {
		return "welcome";
	}
	
//	private String getLoginId() {
//		String currentPrincipalName = "none";
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		if (!(authentication instanceof AnonymousAuthenticationToken)) {
//			currentPrincipalName = authentication.getName();
//		}
//		return currentPrincipalName;
//	}
}
