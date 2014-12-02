package com.fastrax.stayconnected.core.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.fastrax.stayconnected.core.entity.JobListing;

@Repository
public class JobListingDaoImpl implements JobListingDao {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	private DataSourceTransactionManager transactionManager;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(this.dataSource);
	}
	
	@Autowired
	public void setDataSourceTransactionManager(
			DataSourceTransactionManager txManager) {
		this.transactionManager = txManager;
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
		TransactionStatus status = transactionManager.getTransaction(def);
	
		try {
			String SQL = "insert into job_listing (email, position, company_name, job_description, job_location) values "
					+ "(?,?,?,?,?)";

			String email = jl.getEmail();
			String position = jl.getPosition();
			String company_name = jl.getCompany_name();
			String job_description = jl.getJob_description();
			String job_location = jl.getJob_location();
			
			jdbcTemplate.update(SQL,email,position,company_name,job_description,job_location);
			
			jl.setId(getRecentJobID());
			
			transactionManager.commit(status);
		} catch (DataAccessException e) {
			System.out.println("Error in creating Job Listing record, rolling back");
			transactionManager.rollback(status);
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
	 * Gets the all the job listings
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
	 * Gets the all the active job listings
	 * @author Conner Simmons
	 * @precondition None?
	 * @postcondition A list of all active job listings is returned
	 * @return A list of all active job listings in the database
	 */
	@Override
	public List<JobListing> getActiveJobListings() {
		String SQL = "select * from job_listing where active=true";
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
		TransactionStatus status = transactionManager.getTransaction(def);
	
		try {
		String sql = "UPDATE job_listing SET email = ?, position = ?, "
				+ "company_name = ?, job_description = ?, job_location = ? "
				+ "WHERE id = ?";
		
		Object[] params = {jobListing.getEmail(), jobListing.getPosition(), 
				jobListing.getCompany_name(), jobListing.getJob_description(), 
				jobListing.getJob_location(), jobListing.getId()};
		
		jdbcTemplate.update(sql, params);
		transactionManager.commit(status);
		System.out.println("Updated Record with ID = " + jobListing.getId());
		} catch (DataAccessException e) {
			System.out.println("Error in updating Job Listing record, rolling back");
			transactionManager.rollback(status);
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
	 * Gets the three most recent job listings
	 * @author Louis Balzani
	 * @precondition None
	 * @postcondition A list of three job listings is returned
	 * @return A list of three job listings in the database
	 */
	public List<JobListing> getRecentJobListings() {
		List<JobListing> allListings = getActiveJobListings();
		List<JobListing> recent = null;
		int size = allListings.size();
		if (size < 3) {
			recent = allListings;
		}
		else {
			recent = allListings.subList(size-3, size);
		}
		return recent;
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
		String SQL = "select * from job_listing where email = ?, active = 1";
		List<JobListing> joblistings = jdbcTemplate.query(SQL,
				new Object[] { email }, new JobListingMapper());
		return joblistings;
	}
	
	/**
	 * Gets a job listing with a specified location 
	 * @author Michael Holmes
	 * @precondition The job listing with the specified location exists
	 * @postcondition The job listing with the specified location is returned
	 * @return A job listing with that location specified
	 */
	public List<JobListing> getJobListingsByLocation(String location) {
		location = "%" + location + "%";
		String SQL = "select * from job_listing where job_location LIKE ?";
		List<JobListing> joblistings = jdbcTemplate.query(SQL,
				new Object[] { location }, new JobListingMapper());
		return joblistings;
	}

	/**
	 * Gets job listings with multiple specified fields
	 * @author Michael Holmes
	 * @precondition The multiple specified fields
	 * @postcondition Job listings wit multiple specified fields is returned
	 * @return Job listings with multiple specified fields is returned
	 */
	public List<JobListing> getJobByMultiple(String email, String position, String company, String desc, String location) {
		email = "%" + email + "%";
		position = "%" + position + "%";
		company = "%" + company + "%";
		desc = "%" + desc + "%";
		location = "%" + location + "%";
		
		String SQL = "select * from job_listing where email LIKE ? AND position LIKE ? AND company_name LIKE ? AND job_description LIKE ? AND job_location LIKE ?";
		List<JobListing> joblistings = jdbcTemplate.query(SQL,
				new Object[] {email, position, company, desc, location }, new JobListingMapper());
		return joblistings;
	}
	
	/**
	 * Gets job listings using the Full Text search in MySQL (searches across position, company, description, and location)
	 * @author Michael Holmes
	 * @precondition A search term
	 * @postcondition The job listings who match the search term
	 * @return the job listings which match the search terms
	 */
	public List<JobListing> getJobFullTextSearch(String searchText) {
		String searchTextFull;
		searchTextFull = searchText + "*";
		String SQL = "SELECT *, MATCH (position,company_name, job_description,job_location) AGAINST (? IN BOOLEAN MODE) AS relevance FROM job_listing WHERE MATCH (position,company_name, job_description,job_location) AGAINST (? IN BOOLEAN MODE) ORDER BY relevance DESC;";
		List<JobListing> joblistings = jdbcTemplate.query(SQL,
				new Object[] {searchText, searchTextFull }, new JobListingMapper());
		return joblistings;
	}

	/**  
	 * Dectivate a job listing
	 * @author Conner Simmons
	 * @precondition Job Listing exists in database
	 * @postcondition Job Listing has been changed to deactive
	 * @return true to show method completion
	 */
	@Override
	public int deactivate(JobListing jl) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
		TransactionStatus status = transactionManager.getTransaction(def);

		try {
			String SQL = "UPDATE job_listing "
					   + "SET active=false "
					   + "WHERE id=?";
			int id = jl.getId();
			jdbcTemplate.update(SQL,id);

			transactionManager.commit(status);
		} catch (DataAccessException e) {
			System.out.println("Error in deactivating job listing, rolling back");
			transactionManager.rollback(status);
			throw e;
		}
		return 1; 
	}
	
	/**  
	 * Activate a job listing
	 * @author Conner Simmons
	 * @precondition Job Listing exists in database
	 * @postcondition Job Listing has been changed to active
	 * @return true to show method completion
	 */
	@Override
	public int activate(JobListing jl) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
		TransactionStatus status = transactionManager.getTransaction(def);

		try {
			String SQL = "UPDATE job_listing "
					   + "SET active=true "
					   + "WHERE id=?";
			int id = jl.getId();
			jdbcTemplate.update(SQL,id);

			transactionManager.commit(status);
		} catch (DataAccessException e) {
			System.out.println("Error in updating AccountDao active, rolling back");
			transactionManager.rollback(status);
			throw e;
		}
		return 1; 
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
		jl.setCompany_name(rs.getString("company_name"));
		jl.setJob_location(rs.getString("job_location"));
		jl.setPosted_date(rs.getDate("posted_date"));
		jl.setActive(rs.getBoolean("active"));
		System.out.println(rs.getString("job_description"));
		return jl;
	}
}
