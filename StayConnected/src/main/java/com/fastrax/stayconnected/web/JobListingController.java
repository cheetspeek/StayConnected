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
	
	/**
	 * Controller for create job listing page
	 * @author Ben Degler
	 * @param model					Model object of JSP files
	 * @return JobListingCreation	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/createlisting", method = RequestMethod.GET)
	public String createListing(Model model) {
		return "JobListingCreation";
	}
	
	/**
	 * Controller for update job listing page
	 * @author Ben Degler
	 * @param model					Model object of jsp files
	 * @return JobListingCreation	JSP of job listing update page
	 */
	@RequestMapping(value = "/updatelisting", method = RequestMethod.GET)
	public String updateListing(Model model) {
		//pull data from listing of db and populate form
		return "JobListingCreation";
	}
	
	/**
	 * Controller for confirmation of new job listing page 
	 * @author Ben Degler
	 * @param model						Model object of jsp files
	 * @return JobListingConfirmation	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/confirmlisting", method = RequestMethod.GET)
	public String confirmListing(Model model) {
		return "JobListingConfirmation";
	}
	
	/**
	 * Controller for viewing job listing page
	 * @author Ben Degler
	 * @param model			Model object of jsp files
	 * @return JobListing	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/viewlisting", method = RequestMethod.GET)
	public String viewListing(Model model) {
		return "JobListing";
	}	

}
