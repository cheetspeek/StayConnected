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
	 * @return JobListingConfirmation	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/jobListingConfirmation", method = RequestMethod.POST)
	public String processSubmit(@Valid @ModelAttribute("jobListing") JobListing jobListing, BindingResult result, Model model) {
		if(result.hasErrors()){
			return "joblisting/JobListingCreation";
		}
		jobListingService.createJobListing(jobListing);
		return "joblisting/JobListingConfirmation";
	}

	/**
	 * Controller for update job listing page
	 * @author Ben Degler, Conner Simmons
	 * @param locale				a new Locale object
	 * @param model					Model object of jsp files
	 * @return JobListingCreation	JSP of job listing update page
	 */
	@RequestMapping(value = "/updatelisting", method = RequestMethod.POST)
	public String updateListing(@ModelAttribute JobListing jobListing, Locale locale, Model model) {
		JobListing jl = jobListingService.getJobListingById(jobListing.getId());
		model.addAttribute("jobListing", jl);
		return "joblisting/JobListingUpdate";
	}

	/**
	 * Controller for confirmation of new job listing page 
	 * @author Ben Degler
	 * @param locale					a new Locale object
	 * @param model						Model object of jsp files
	 * @return JobListingConfirmation	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/jobListingConfirmUpdate", method = RequestMethod.POST)
	public String jobListingConfirmUpdate(@Valid @ModelAttribute JobListing jobListing, BindingResult result, Model model) {
		if(result.hasErrors()){
			return "joblisting/JobListingUpdate";
		}
		jobListingService.updateJobListing(jobListing);
		return "joblisting/JobListingConfirmUpdate";
	}

	/**
	 * Controller for viewing job listing page
	 * @author Ben Degler
	 * @param locale		a new Locale object
	 * @param model			Model object of jsp files
	 * @return JobListing	JSP of showing all job listings
	 */
	@RequestMapping(value = "/viewlisting", method = RequestMethod.GET)
	public String viewListing(Locale locale, Model model) {
		jobItems = jobListingService.getAllJobListings();
		model.addAttribute("listing", jobItems);
		return "joblisting/JobListing";
	}	
	
	/**
	 * Controller for viewing job listing page
	 * @author Ben Degler
	 * @param locale		a new Locale object
	 * @param model			Model object of jsp files
	 * @return JobListing	JSP of showing all job listings
	 */
	@RequestMapping(value = "/viewlistingbyacct", method = RequestMethod.GET)
	public String viewListingByAcct(Principal principal, Locale locale, Model model) {
		jobItems = jobListingService.getJobListingsByEmail(principal.getName());
		model.addAttribute("listing", jobItems);
		return "joblisting/JobListingByAcct";
	}	
	
	/**
	 * Controller for searching job listing page
	 * @author Michael Holmes
	 * @param locale		a new Locale object
	 * @param model			Model object of jsp files
	 * @return 	
	 */
	@RequestMapping(value = "/searchlisting", method = RequestMethod.GET)
	public String searchListing(Principal principal, Locale locale, Model model) {
		JobListing jl = new JobListing();
		model.addAttribute("searchListing", jl);
		return "joblisting/SearchListing";
	}	
	
	/**
	 * Controller for confirmation of search job listing page by location
	 * @author Michael Holmes, Ben Degler
	 * @param locale					a new Locale object
	 * @param model						Model object of jsp files
	 * @return JobListingConfirmation	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/searchConfirmation", method = RequestMethod.POST)
	public String processSearchListing(@Valid @ModelAttribute("searchListing") JobListing jobListing, BindingResult result, Model model) {
		String location = jobListing.getJob_location();
		String email = jobListing.getEmail();
		String company = jobListing.getCompany_name();
		String desc = jobListing.getJob_description();
		String pos = jobListing.getPosition();
		jobItems = jobListingService.getJobByMultiple(email, pos, company, desc, location);
		model.addAttribute("listing", jobItems);
		if (jobItems.size() < 1) { return "joblisting/JobListingFail";}
		else {return "joblisting/JobListing";}
	}
	
	/**
	 * Controller for confirmation of search job listing page by location
	 * @author Michael Holmes, Louis Balzani
	 * @param locale					a new Locale object
	 * @param model						Model object of jsp files
	 * @return JobListingConfirmation	JSP of job listing confirmation page
	 */
	@RequestMapping(value = "/globalSearch", method = RequestMethod.POST)
	public String processGlobalSearchListing(@Valid @ModelAttribute("searchTerm") JobListing jobListing, BindingResult result, Model model) {
		String deh = null;
		jobItems = jobListingService.getJobFullTextSearch(deh);
		model.addAttribute("listing", jobItems);
		if (jobItems.size() < 1) { return "joblisting/JobListingFail";}
		else {return "joblisting/JobListing";}
	}
}
