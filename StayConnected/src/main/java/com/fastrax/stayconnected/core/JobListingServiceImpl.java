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
	 * Uses JobListingDAO to return a list of all job a new job listing on the database 
	 * @author Conner Simmons
	 * @precondition  None
	 * @postcondition A list of all job listings is returned
	 * @return list of all job listings in the database
	 */
	public List<JobListing> getAllJobListings() {
		return jobListingDao.getAllJobListings();
	}

	public int deactivate(JobListing jobListing) {
		return jobListingDao.deactivate(jobListing);
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

	public int getNumberOfJobsByLocation(String location) {
		return jobListingDao.getNumberOfJobsByLocation(location);
	}
}
