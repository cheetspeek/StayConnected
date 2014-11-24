package com.fastrax.stayconnected.core.entity;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Account {
	private int id;
	@Size(min=1,max=50)
	private String firstname;
	@Size(min=1,max=50)
	private String lastname;
	@Size(min=1,max=250)
	private String address;
	@Size(min=1,max=100)
	private String city;
	private String state;
	private String country;
	@Size(min=7)
	private String phone;
	@Email @NotEmpty
	private String email;
	@Email @NotEmpty
	private String emailConfirm;
	@Size(min=6)
	private String password;
	@Size(min=6)
	private String passwordConfirm;
	private boolean active;
	@NotEmpty
	private String[] roleList; 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
