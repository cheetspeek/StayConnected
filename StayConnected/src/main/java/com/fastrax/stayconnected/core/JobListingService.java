package com.fastrax.stayconnected.core;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fastrax.stayconnected.core.entity.JobListing;

@Service
public interface JobListingService {
	public JobListing createJobListing(JobListing jobListing);
	public int getRecentJobID();
	public List<JobListing> getAllJobListings();
	public List<JobListing> getActiveJobListings();
	public int deactivate(JobListing jobListing);
	public int activate(JobListing jobListing);
	public JobListing getJobListingById(int id);
	public int getNumberOfJobListings();
	public List<JobListing> getJobListingsByEmail(String email);
	public List<JobListing> getRecentJobListings();
	public int updateJobListing(JobListing jobListing);
	public List<JobListing> getJobByMultiple(String email, String position, String company, String desc, String location);
	public List<JobListing> getJobFullTextSearch(String searchTerm);
}
