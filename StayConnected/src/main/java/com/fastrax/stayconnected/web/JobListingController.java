package com.fastrax.stayconnected.web;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class JobListingController {
	
	/**
	 * Controller for create job listing page
	 * @author Ben Degler
	 * @param model					Model object of JSP files
	 * @return JobListingCreation	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/createlisting", method = RequestMethod.GET)
	public String createListing(Locale locale, Model model) {
		return "JobListingCreation";
	}
	
	/**
	 * Controller for update job listing page
	 * @author Ben Degler
	 * @param model					Model object of jsp files
	 * @return JobListingCreation	JSP of job listing update page
	 */
	@RequestMapping(value = "/updatelisting", method = RequestMethod.GET)
	public String updateListing(Locale locale, Model model) {
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
	public String confirmListing(Locale locale, Model model) {
		return "JobListingConfirmation";
	}
	
	/**
	 * Controller for viewing job listing page
	 * @author Ben Degler
	 * @param model			Model object of jsp files
	 * @return JobListing	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/viewlisting", method = RequestMethod.GET)
	public String viewListing(Locale locale, Model model) {
		return "JobListing";
	}	
}
