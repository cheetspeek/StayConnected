package com.fastrax.stayconnected.core.entity;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Account {
	
	@Size(min=1,max=20)
	private String firstname;
	@Size(min=1,max=20)
	private String lastname;
	@Email
	private String email;
	@Email
	private String emailConfirm;
	@Size(min=6,max=40)
	private String password;
	@Size(min=6,max=40)
	private String passwordConfirm;
	private boolean active;
	@NotEmpty
	private String[] roleList; 
	
	public String[] getRoleList() {
		return roleList;
	}
	public void setRoleList(String[] roleList) {
		this.roleList = roleList;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public String getEmailConfirm() {
		return emailConfirm;
	}
	public void setEmailConfirm(String emailConfirm) {
		this.emailConfirm = emailConfirm;
	}
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
}
