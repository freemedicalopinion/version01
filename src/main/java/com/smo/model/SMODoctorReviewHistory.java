package com.smo.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class SMODoctorReviewHistory implements Serializable{
	
	private static final long serialVersionUID = 3460493199623703461L;
	
	@Id
	private String id;
	private String userName;
	private String reviewerEmail;
	private String reviewerComment;
	private String reviewerIp;
	private int recommend;
	private int staffRating;
	private int helpfulnessRating;
	private int knowledgeRating;
	private int punctualityRating;
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
	
	
	public String getReviewerIp() {
		return reviewerIp;
	}
	public void setReviewerIp(String reviewerIp) {
		this.reviewerIp = reviewerIp;
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
	public int getStaffRating() {
		return staffRating;
	}
	public void setStaffRating(int staffRating) {
		this.staffRating = staffRating;
	}
	public int getHelpfulnessRating() {
		return helpfulnessRating;
	}
	public void setHelpfulnessRating(int helpfulnessRating) {
		this.helpfulnessRating = helpfulnessRating;
	}
	public int getKnowledgeRating() {
		return knowledgeRating;
	}
	public void setKnowledgeRating(int knowledgeRating) {
		this.knowledgeRating = knowledgeRating;
	}
	public int getPunctualityRating() {
		return punctualityRating;
	}
	public void setPunctualityRating(int punctualityRating) {
		this.punctualityRating = punctualityRating;
	}
	
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	
	
	
	
	

}
