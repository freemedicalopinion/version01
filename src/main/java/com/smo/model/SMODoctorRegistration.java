package com.smo.model;

import java.util.Date;

public class SMODoctorRegistration {
	
	private long id=new Date().getTime();
	private String registrationNo;
	private Integer yearOfRegistration;
	private String stateMedicalCouncil;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getRegistrationNo() {
		return registrationNo;
	}
	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}
	public Integer getYearOfRegistration() {
		return yearOfRegistration;
	}
	public void setYearOfRegistration(Integer yearOfRegistration) {
		this.yearOfRegistration = yearOfRegistration;
	}
	public String getStateMedicalCouncil() {
		return stateMedicalCouncil;
	}
	public void setStateMedicalCouncil(String stateMedicalCouncil) {
		this.stateMedicalCouncil = stateMedicalCouncil;
	}
	
	
	

	
}
