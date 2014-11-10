package com.fastrax.stayconnected.web;

import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fastrax.stayconnected.core.AccountService;
import com.fastrax.stayconnected.core.JobListingService;
import com.fastrax.stayconnected.core.entity.Account;
import com.fastrax.stayconnected.core.entity.JobListing;

@Controller
public class JobListingController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private JobListingService jobListingService;
	
	/**
	 * Controller for create job listing page
	 * @author Ben Degler
	 * @param locale				a new Locale object
	 * @param model					Model object of JSP files
	 * @return JobListingCreation	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/createlisting", method = RequestMethod.GET)
	public String createListing(Locale locale, Model model) {
		return "joblisting/JobListingCreation";
	}
	
	/**
	 * Controls the job listing confirmation page mapping
	 * @author Ben Delger & Louis Balzani
	 * @param locale				a new Locale object
	 * @param model					properties of the Model object	
	 * @return AccountConfirmation	account confirm page of registering user
	 */
	@RequestMapping(value = "/jobListingConfirmation", method = RequestMethod.POST)
	public String processSubmit(@Valid @ModelAttribute("jobListing") JobListing newListing, BindingResult result, Model model) {
		if(result.hasErrors()){
			return "joblisting/JobListingCreation";
		}
		jobListingService.createJobListing(newListing);
		return "joblisting/JobListingConfirmation";
	}
	
	/**
	 * Controller for update job listing page
	 * @author Ben Degler
	 * @param locale				a new Locale object
	 * @param model					Model object of jsp files
	 * @return JobListingCreation	JSP of job listing update page
	 */
	@RequestMapping(value = "/updatelisting", method = RequestMethod.GET)
	public String updateListing(Locale locale, Model model) {
		//pull data from listing of db and populate form
		return "joblisting/JobListingCreation";
	}
	
	/**
	 * Controller for confirmation of new job listing page 
	 * @author Ben Degler
	 * @param locale					a new Locale object
	 * @param model						Model object of jsp files
	 * @return JobListingConfirmation	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/confirmlisting", method = RequestMethod.GET)
	public String confirmListing(Locale locale, Model model) {
		return "joblisting/JobListingConfirmation";
	}
	
	/**
	 * Controller for viewing job listing page
	 * @author Ben Degler
	 * @param locale		a new Locale object
	 * @param model			Model object of jsp files
	 * @return JobListing	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/viewlisting", method = RequestMethod.GET)
	public String viewListing(Locale locale, Model model) {
		return "joblisting/JobListing";
	}	
}
