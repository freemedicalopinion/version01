package com.smo.model;

import java.io.Serializable;

public class SMOEducation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2110984831167434602L;
	private long id;
	private String degree;
	private String college;
	private Integer yearOfStarting;
	private Integer yearOfCompletion;
	private String city;
	private String country;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public Integer getYearOfStarting() {
		return yearOfStarting;
	}
	public void setYearOfStarting(Integer yearOfStarting) {
		this.yearOfStarting = yearOfStarting;
	}
	public Integer getYearOfCompletion() {
		return yearOfCompletion;
	}
	public void setYearOfCompletion(Integer yearOfCompletion) {
		this.yearOfCompletion = yearOfCompletion;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}

	


}
