package com.fastrax.stayconnected.core.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.fastrax.stayconnected.core.entity.JobListing;

@Repository
public class JobListingDaoImpl implements JobListingDao {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	//private DataSourceTransactionManager transactionManager;


	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(this.dataSource);
	}

	/**
	 * Creates a new user Job Listing
	 * @author Michael Holmes, Conner Simmons
	 * @precondition None?
	 * @postcondition job listing is created in the job_listing table on the database
	 * @param Joblisting	a job listing object
	 * @return Joblisting	the new joblisting with job listing's information
	 */
	@Override
	public JobListing createJobListing(JobListing jl) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
		//TransactionStatus status = transactionManager.getTransaction(def);
	
		try {
			String SQL = "insert into job_listing (email, position, job_name, job_description, job_location, active) values "
					+ "(?,?,?,?,?,?)";

			String email = jl.getEmail();
			String position = jl.getPosition();
			String job_name = jl.getJob_name();
			String job_description = jl.getJob_description();
			String job_location = jl.getJob_location();
			boolean active = jl.isActive();
			
			jdbcTemplate.update(SQL,email,position,job_name,job_description,job_location,active);
			
			jl.setId(getRecentJobID());
			
			//transactionManager.commit(status);
		} catch (DataAccessException e) {
			System.out.println("Error in creating Job Listing record, rolling back");
			//transactionManager.rollback(status);
			throw e;
		}
		return jl;	
	}
	
	/**
	 * Gets the most recent joblisting ID
	 * @author Michael Holmes
	 * @precondition Database has at least one joblisting
	 * @postcondition ID of the most recently added to the database job listing is returned
	 * @return the ID of the most recently added job listing to the database
	 */
	@Override
	public int getRecentJobID() {
		String sql = "select max(id) from job_listing";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	/**
	 * Gets the all the joblistings
	 * @author Michael Holmes
	 * @precondition None?
	 * @postcondition A list of all job listings is returned
	 * @return A list of all job listings in the database
	 */
	@Override
	public List<JobListing> getAllJobListings() {
		String SQL = "select * from job_listing";
		List<JobListing> joblistings = jdbcTemplate.query(SQL, new JobListingMapper());
		return joblistings;
	}
	
	/**
	 * Update a job listing
	 * @author Conner Simmons
	 * @precondition The job listing exists
	 * @postcondition The job listing is updated
	 * @return 1, Meaning update has been completed
	 */
	public int updateJobListing(JobListing jobListing) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
		//TransactionStatus status = transactionManager.getTransaction(def);
	
		try {
		String sql = "UPDATE job_listing SET email = ?, position = ?, "
				+ "job_name = ?, job_description = ?, job_location = ? "
				+ "WHERE id = ?";
		
		Object[] params = {jobListing.getEmail(), jobListing.getPosition(), 
				jobListing.getJob_name(), jobListing.getJob_description(), 
				jobListing.getJob_location(), jobListing.getId()};
		
		jdbcTemplate.update(sql, params);
		System.out.println("Updated Record with ID = " + jobListing.getId());
		} catch (DataAccessException e) {
			System.out.println("Error in updating Job Listing record, rolling back");
			//transactionManager.rollback(status);
			throw e;
		}
		return 1;
	}

	/**
	 * Gets a job listing with a specified ID number
	 * @author Conner Simmons
	 * @precondition The job listing with the specified ID number exists
	 * @postcondition The job listing with the specified ID number is returned
	 * @return A job listing with the ID number specified
	 */
	public JobListing getJobListingById(int id) {
		String SQL = "select * from job_listing where id = ?";
		JobListing jl = jdbcTemplate.queryForObject(SQL,
				new Object[] { id }, new JobListingMapper());
		return jl;
	}

	/**
	 * Get the number of job listings
	 * @author Conner Simmons
	 * @precondition None?
	 * @postcondition Number of job listings is returned
	 * @return The number of job listings in the database
	 */
	public int getNumberOfJobListings() {
		String sql = "select count(*) from job_listing";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	/**
	 * Gets a job listing with a specified ID number
	 * @author Conner Simmons
	 * @precondition The job listing with the specified ID number exists
	 * @postcondition The job listing with the specified ID number is returned
	 * @return A job listing with the ID number specified
	 */
	public List<JobListing> getJobListingsByEmail(String email) {
		String SQL = "select * from job_listing where email = ?";
		List<JobListing> joblistings = jdbcTemplate.query(SQL,
				new Object[] { email }, new JobListingMapper());
		return joblistings;
	}
	
	/**
	 * Gets a job listing with a specified ID number
	 * @author Conner Simmons
	 * @precondition The job listing with the specified ID number exists
	 * @postcondition The job listing with the specified ID number is returned
	 * @return A job listing with the ID number specified
	 */
	public List<JobListing> getJobListingsByLocation(String location) {
		String SQL = "select * from job_listing where job_location = ?";
		List<JobListing> joblistings = jdbcTemplate.query(SQL,
				new Object[] { location }, new JobListingMapper());
		return joblistings;
	}


	@Override
	public int getNumberOfJobsByLocation(String location) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deactivate(JobListing jl) {
		// TODO Auto-generated method stub
		return 0;
	}
}

//Helper class to map the result set to the JobListing class
class JobListingMapper implements RowMapper<JobListing> {
	public JobListing mapRow(ResultSet rs, int rowNum) throws SQLException {
		JobListing jl = new JobListing();
		jl.setId(rs.getInt("id"));
		jl.setPosition(rs.getString("position"));
		jl.setEmail(rs.getString("email"));
		jl.setJob_description(rs.getString("job_description"));
		jl.setJob_name(rs.getString("job_name"));
		jl.setJob_location(rs.getString("job_location"));
		jl.setActive(rs.getBoolean("active"));
		return jl;
	}
}
