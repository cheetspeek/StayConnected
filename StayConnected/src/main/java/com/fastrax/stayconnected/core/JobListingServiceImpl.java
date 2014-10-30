package com.fastrax.stayconnected.core;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fastrax.stayconnected.core.entity.JobListing;

@Service
public class JobListingServiceImpl implements JobListingService {
	@Autowired
	private JobListing jobListingDao;

	public JobListing createJobListing(JobListing jobListing) {
		return jobListingDao.createJobListing(jobListing);
	}

	public List<JobListing> getAllJobListings() {
		return jobListingDao.getAllJobListings();
	}

	public int delete(JobListing jobListing) {
		return jobListingDao.delete(jobListing);
	}

	public JobListing getJobListingById(int id) {
		JobListing jobListing = jobListingDao.getJobListingById(id);
		if (jobListing == null) {
			jobListing = new JobListing();
			jobListing.setId(0);
		}
		return jobListing;
	}

	public int getNumberOfJobListings() {
		return jobListingDao.getNumberOfJobListings();
	}
}
