package com.fastrax.stayconnected.core;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fastrax.stayconnected.core.entity.JobListing;

@Service
public interface JobListingService {
	public JobListing createJobListing(JobListing jobListing);
	public int getRecentJobID();
	public List<JobListing> getAllJobListings();
	public int deactivate(JobListing jobListing);
	public JobListing getJobListingById(int id);
	public int getNumberOfJobListings();
	public List<JobListing> getJobListingsByEmail(String email);
	public List<JobListing> getJobListingsByLocation(String location);
	public int getNumberOfJobsByLocation(String location);
	public int updateJobListing(JobListing jobListing);
}
