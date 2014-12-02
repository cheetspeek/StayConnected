package com.fastrax.stayconnected.core;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fastrax.stayconnected.core.db.JobListingDao;
import com.fastrax.stayconnected.core.entity.JobListing;

@Service
public class JobListingServiceImpl implements JobListingService {
	@Autowired
	private JobListingDao jobListingDao;

	/**
	 * Uses JobListingDAO to create a new job listing on the database 
	 * @author Conner Simmons
	 * @precondition JobListing entity exists and passed in as an argument
	 * @postcondition Job Listing is created in the database and passed back with the database ID updated
	 * @param JobListing	a job listing object
	 * @return JobListing	the new JobListing with the database ID updated 
	 */
	public JobListing createJobListing(JobListing jobListing) {
		return jobListingDao.createJobListing(jobListing);
	}
	
	/**
	 * Uses JobListingDAO to return the ID of the most recent listing in the database 
	 * @author Conner Simmons
	 * @precondition None?
	 * @postcondition Job Listing ID is returned
	 * @return int	the ID of the most recent JobListing added to the database
	 */
	public int getRecentJobID() {
		return jobListingDao.getRecentJobID();
	}
	
	/**
	 * Gets a job listing with multiple specified fields
	 * @author Michael Holmes
	 * @precondition The multiple specified fields
	 * @postcondition The job listing wit multiple specified fields is returned
	 * @return A job listing with multiple specified fields is returned
	 */
	public List<JobListing> getJobByMultiple(String email, String position, String company, String desc, String location) {
		return jobListingDao.getJobByMultiple(email, position, company, desc, location);
	}

	/**
	 * Uses JobListingDAO to return a list of all job listings in the database 
	 * @author Conner Simmons
	 * @precondition  None
	 * @postcondition A list of all job listings is returned
	 * @return list of all job listings in the database
	 */
	public List<JobListing> getAllJobListings() {
		return jobListingDao.getAllJobListings();
	}
	
	/**
	 * Uses JobListingDAO to return a list of all active job listings in the database 
	 * @author Conner Simmons
	 * @precondition  None
	 * @postcondition A list of all active job listings is returned
	 * @return list of all active job listings in the database
	 */
	public List<JobListing> getActiveJobListings() {
		return jobListingDao.getActiveJobListings();
	}
	
	/**
	 * Uses JobListingDAO to return a list of all job listings 
	 * by a given email address in the database 
	 * @author Conner Simmons
	 * @precondition  None
	 * @postcondition A list of all job listings by the email is returned
	 * @return list of all job listings in the database by given email
	 */
	public List<JobListing> getJobListingsByEmail(String email) {
		return jobListingDao.getJobListingsByEmail(email);
	}

	/**
	 * Uses JobListingDAO to return a list of three recent job listings on the database 
	 * @author Louis Balzani
	 * @precondition  None
	 * @postcondition A list of three job listings is returned
	 * @return list of three job listings in the database
	 */
	public List<JobListing> getRecentJobListings() {
		return jobListingDao.getRecentJobListings();
	}
	
	/**
	 * Uses JobListingDAO to deactivate a job listing
	 * @author Conner Simmons 
	 * @precondition  The job listing exists in the database
	 * @postcondition The job listing is deactivated
	 * @return true to show method completion
	 */
	public int deactivate(JobListing jobListing) {
		return jobListingDao.deactivate(jobListing);
	}
	
	/**
	 * Uses JobListingDAO to activate a job listing
	 * @author Conner Simmons 
	 * @precondition  The job listing exists in the database
	 * @postcondition The job listing is activated
	 * @return true to show method completion
	 */
	public int activate(JobListing jobListing) {
		return jobListingDao.activate(jobListing);
	}

	public List<JobListing> getJobFullTextSearch(String searchTerm){
		return jobListingDao.getJobFullTextSearch(searchTerm);
	}

	public JobListing getJobByListingsId(int id) {
		JobListing jobListing = jobListingDao.getJobListingById(id);
		if (jobListing == null) {
			jobListing = new JobListing();
			jobListing.setId(0);
		}
		return jobListing;
	}
	
	public JobListing getJobListingById(int id) {
		return jobListingDao.getJobListingById(id);
	}

	public int getNumberOfJobListings() {
		return jobListingDao.getNumberOfJobListings();
	}
	
	public int updateJobListing(JobListing jobListing){
		return jobListingDao.updateJobListing(jobListing);
	}
}
