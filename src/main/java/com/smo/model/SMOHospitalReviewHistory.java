package com.smo.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class SMOHospitalReviewHistory implements Serializable{
	
	private static final long serialVersionUID = 3460493199623703461L;
	
	@Id
	private String id;
	private String userName;
	private String reviewerEmail;
	private String reviewerComment;
	private String reviewerIp;
	private int recommend;
	private int cleanliness;
	private int facilities;
	private int services;
	private int value;
	private Date createdDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getReviewerEmail() {
		return reviewerEmail;
	}
	public void setReviewerEmail(String reviewerEmail) {
		this.reviewerEmail = reviewerEmail;
	}
	public String getReviewerComment() {
		return reviewerComment;
	}
	public void setReviewerComment(String reviewerComment) {
		this.reviewerComment = reviewerComment;
	}
	public String getReviewerIp() {
		return reviewerIp;
	}
	public void setReviewerIp(String reviewerIp) {
		this.reviewerIp = reviewerIp;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getCleanliness() {
		return cleanliness;
	}
	public void setCleanliness(int cleanliness) {
		this.cleanliness = cleanliness;
	}
	public int getFacilities() {
		return facilities;
	}
	public void setFacilities(int facilities) {
		this.facilities = facilities;
	}
	public int getServices() {
		return services;
	}
	public void setServices(int services) {
		this.services = services;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	
}
