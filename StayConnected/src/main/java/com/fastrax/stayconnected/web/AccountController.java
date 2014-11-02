package com.fastrax.stayconnected.web;

import java.security.Principal;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Controls the user home page mapping
	 * @author Ben Degler
	 * @param principal		Used to access security interface and get current users name
	 * @param model			properties of the Model object	
	 * @return AccountHome	account home page of logged in user
	 */
	@RequestMapping(value = {"/","/accounthome"}, method = RequestMethod.GET)
	public String home(Principal principal, Model model) {
//		logger.info("login ID via Controller is: "+ principal.getName());
//		logger.info("login ID via AuthenticationContext is: "+ getLoginId());
		return "AccountHome";
	}
	
	/**
	 * Controls the user registration page mapping
	 * @author Ben Degler	
	 * @param model					properties of the Model object	
	 * @return AccountRegistration	account register page for new user
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		return "AccountRegistration";
	}
	
	/**
	 * Controls the user confirmation page mapping
	 * @author Ben Degler
	 * @param model					properties of the Model object	
	 * @return AccountConfirmation	account confirm page of registering user
	 */
	@RequestMapping(value = "/registerconfirm", method = RequestMethod.GET)
	public String registerConfirmation(Locale locale, Model model) {
		return "AccountConfirmation";
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
