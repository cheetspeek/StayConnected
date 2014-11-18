package com.fastrax.stayconnected.core.db;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.fastrax.stayconnected.core.entity.JobListing;

@Repository
public interface JobListingDao {
	public JobListing createJobListing(JobListing jl);
	public List<JobListing> getAllJobListings();
	public int getRecentJobID();
	public int deactivate(JobListing jl);
	public JobListing getJobListingById(int id);
	public int getNumberOfJobListings();
	public int getNumberOfJobsByLocation(String location);
	public int updateJobListing(JobListing jl);
}
