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
	 * Controller for update job listing page
	 * @author Ben Degler, Conner Simmons
	 * @param locale				a new Locale object
	 * @param model					Model object of jsp files
	 * @return JobListingCreation	JSP of job listing update page
	 */
	@RequestMapping(value = "/joblistingdeactconfirm", method = RequestMethod.POST)
	public String jobListingDeactConfirm(@ModelAttribute JobListing jobListing, Locale locale, Model model) {
		JobListing jl = jobListingService.getJobListingById(jobListing.getId());
		jobListingService.deactivate(jl);
		model.addAttribute("jobListing", jl);
		return "joblisting/JobListingDeactStatus";
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
		jobItems = jobListingService.getActiveJobListings();
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
	public String processGlobalSearchListing(@Valid @ModelAttribute("searchTerm") String s, BindingResult result, Model model) {
		String deh = s;
		jobItems = jobListingService.getJobFullTextSearch(deh);
		for(int i = 0; i < jobItems.size(); i++){
			//System.out.println(jobItems.get(i).getJob_description());
		}
		model.addAttribute("listing", jobItems);
		if (jobItems.size() < 1) { return "joblisting/JobListingFail";}
		else {return "joblisting/JobListing";}
	}
	
	/**
	 * Controls the job listing status page mapping
	 * 
	 * @author Conner Simmons, Ben Degler
	 * @param locale 		a new Locale object
	 * @param model			properties of the Model object
	 * @return JobListingStatus		job listing status page for activating/deactivating listings
	 */
	@RequestMapping(value = "/joblistingstatus", method = RequestMethod.GET)
	public String jobListingStatus(Locale locale, Model model) {
		List<JobListing> jobListings = jobListingService.getAllJobListings();
		model.addAttribute("jobListings", jobListings);
		return "joblisting/JobListingStatus";
	}
	
	/**
	 * Controls the job listing status confirmation page mapping
	 * 
	 * @author Conner Simmons, Ben Degler
	 * @param jobListing	a new JobListing object
	 * @param locale		a new Locale object
	 * @param model			properties of the Model object
	 * @return JobListingStatusConfirmation		job listing confirm page for activating/deactivating listings
	 */
	@RequestMapping(value = "/joblistingstatusconfirm", method = RequestMethod.POST)
	public String jobListingStatusConfirm(@Valid @ModelAttribute("jobListing") JobListing jobListing, BindingResult result, Model model) {
		JobListing jl = jobListingService.getJobListingById(jobListing.getId());
		jl.setActive(jobListing.isActive());
		if (jobListing.isActive()) {
			jobListingService.activate(jobListing);
		} else {
			jobListingService.deactivate(jobListing);
		}
		System.out.println(jobListing.getEmail());
		model.addAttribute("jobListings",jl);
		return "joblisting/JobListingStatusConfirm";
	}
}
