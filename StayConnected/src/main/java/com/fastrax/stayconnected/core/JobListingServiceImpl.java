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

	public JobListing createJobListing(JobListing jobListing) {
		return jobListingDao.createJobListing(jobListing);
	}

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
