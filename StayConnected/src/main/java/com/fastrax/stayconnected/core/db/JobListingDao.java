package com.fastrax.stayconnected.core.db;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.fastrax.stayconnected.core.entity.JobListing;


public interface JobListingDao {

	public JobListing createJobListing(JobListing jl);

	public List<JobListing> getAllJobs();

	public JobListing getJobById(int id);
	
	public int getNumberOfJobs();

	public int getNumberOfJobsByLocation(String location);

	public int deactivate(JobListing jl);
}
