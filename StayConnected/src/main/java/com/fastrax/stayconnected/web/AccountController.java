package com.fastrax.stayconnected.web;

import java.security.Principal;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class AccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/accounthome", method = RequestMethod.GET)
	public String home(Principal principal, Model model) {
		logger.info("login ID via Controller is: "+ principal.getName());
		//logger.info("login ID via AuthenticationContext is: "+ getLoginId());
		return "AccountHome";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		return "AccountRegistration";
	}
	
	@RequestMapping(value = "/registerconfirm", method = RequestMethod.GET)
	public String registerConfirmation(Locale locale, Model model) {
		return "AccountConfirmation";
	}
}
