package com.fastrax.stayconnected.web;

import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fastrax.stayconnected.core.JobListingService;
import com.fastrax.stayconnected.core.entity.JobListing;


@Controller
public class JobListingController {
	
	@Autowired
	private JobListingService jobListingService;
	
	private List<JobListing> jobItems;

	/**
	 * Controller for create job listing page
	 * @author Ben Degler, Conner Simmons
	 * @param locale				a new Locale object
	 * @param model					Model object of JSP files
	 * @return JobListingCreation	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/createlisting", method = RequestMethod.GET)
	public String createListing(Principal principal, Locale locale, Model model) {
		JobListing jl = new JobListing();
		jl.setEmail(principal.getName());
		model.addAttribute("jobListing", jl);
		return "joblisting/JobListingCreation";
	}
	
	/**
	 * Controls the job listing confirmation page mapping
	 * @author Ben Delger, Louis Balzani, Conner Simmons
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
	public String updateListing(Principal principal, Locale locale, Model model) {
		//pull data from listing of db and populate form
		JobListing jl = new JobListing();
		jl.setEmail(principal.getName());
		model.addAttribute("jobListing", jl);
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
		jobItems = jobListingService.getAllJobListings();
		model.addAttribute("listing", jobItems);

		return "joblisting/JobListing";
	}	
}
