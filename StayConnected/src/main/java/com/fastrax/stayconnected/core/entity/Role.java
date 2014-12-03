package com.fastrax.stayconnected.core.entity;

public class Role {	
	boolean adminChecked;
	boolean facultyChecked;
	boolean alumniChecked;
	boolean studentChecked;
	
	public boolean isAdminChecked() {
		return adminChecked;
	}
	public void setAdminChecked(boolean adminChecked) {
		this.adminChecked = adminChecked;
	}
	public boolean isFacultyChecked() {
		return facultyChecked;
	}
	public void setFacultyChecked(boolean facultyChecked) {
		this.facultyChecked = facultyChecked;
	}
	public boolean isAlumniChecked() {
		return alumniChecked;
	}
	public void setAlumniChecked(boolean alumniChecked) {
		this.alumniChecked = alumniChecked;
	}
	public boolean isStudentChecked() {
		return studentChecked;
	}
	public void setStudentChecked(boolean studentChecked) {
		this.studentChecked = studentChecked;
	}	
}