package com.fastrax.stayconnected.core.db;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.fastrax.stayconnected.core.entity.JobListing;

@Repository
public interface JobListingDao {
	public JobListing createJobListing(JobListing jl);
	public List<JobListing> getAllJobListings();
	public List<JobListing> getActiveJobListings();
	public int getRecentJobID();
	public int deactivate(JobListing jl);
	public int activate(JobListing jl);
	public JobListing getJobListingById(int id);
	public int getNumberOfJobListings();
	public List<JobListing> getJobListingsByEmail(String email);
	public List<JobListing> getJobListingsByLocation(String location);
	public int getNumberOfJobsByLocation(String location);
	public int updateJobListing(JobListing jl);
	public List<JobListing> getJobByMultiple(String email, String position, String company, String desc, String location);
	public List<JobListing> getJobFullTextSearch(String searchTerm);
	public List<JobListing> getRecentJobListings();
}
