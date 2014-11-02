package com.fastrax.stayconnected.core.entity;


public class JobListing {
private int id;

private int account_id;
private String position;
private String job_name;
private String job_description;
private String job_location;
private boolean active;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

public int getAccount_id() {
	return account_id;
}
public void setAccount_id(int account_id) {
	this.account_id = account_id;
}
public String getPosition() {
	return position;
}
public void setPosition(String position) {
	this.position = position;
}
public String getJob_name() {
	return job_name;
}
public void setJob_name(String job_name) {
	this.job_name = job_name;
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
public boolean isActive() {
	return active;
}
public void setActive(boolean active) {
	this.active = active;
}


}
