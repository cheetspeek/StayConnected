package com.fastrax.stayconnected.web;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

public class JobListingController {
	private String loginId;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/createlisting", method = RequestMethod.GET)
	public String createListing(Locale locale, Model model) {
		return "JobListingCreation";
	}
	
	@RequestMapping(value = "/updatelisting", method = RequestMethod.GET)
	public String updateListing(Locale locale, Model model) {
		//pull data from listing of db and populate form
		return "JobListingCreation";
	}
	
	@RequestMapping(value = "/updatelisting", method = RequestMethod.GET)
	public String confirmListing(Locale locale, Model model) {
		//pull data from listing of db and populate form
		return "JobListingConfirmation";
	}
	
	@RequestMapping(value = "/viewlisting", method = RequestMethod.GET)
	public String viewListing(Locale locale, Model model) {
		return "JobListing";
	}	

}
