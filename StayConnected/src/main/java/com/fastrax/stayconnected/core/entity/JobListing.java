package com.fastrax.stayconnected.core.entity;

import java.sql.Date;

import javax.validation.constraints.Size;


public class JobListing {
	private int id;
	//The user who created the listing's email.
	private String email;
	@Size(min=1,max=100)
	private String position;
	@Size(min=1,max=100)
	private String company_name;
	@Size(min=1,max=2000)
	private String job_description;
	@Size(min=1,max=100)
	private String job_location;
	private Date posted_date;
	private boolean active;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getJob_description() {
		return job_description;
	}
	public void setJob_description(String job_description) {
		this.job_description = job_description;
	}
	public String getJob_location() {
		return job_location;
	}
	public void setJob_location(String job_location) {
		this.job_location = job_location;
	}
	public Date getPosted_date() {
		return posted_date;
	}
	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
}
