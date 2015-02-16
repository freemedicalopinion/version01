package com.smo.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class SMOTmpToken implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	private String userId;
	private String emailVerificationToken;
	private String forgotPasswordToken;
	private Date forgotPasswordTokenDate;
	private String tmpCodeForForgot;
	private String changePasswordToken;
	private Date changePasswordTokenDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmailVerificationToken() {
		return emailVerificationToken;
	}

	public void setEmailVerificationToken(String emailVerificationToken) {
		this.emailVerificationToken = emailVerificationToken;
	}

	public String getForgotPasswordToken() {
		return forgotPasswordToken;
	}

	public void setForgotPasswordToken(String forgotPasswordToken) {
		this.forgotPasswordToken = forgotPasswordToken;
	}

	public Date getForgotPasswordTokenDate() {
		return forgotPasswordTokenDate;
	}

	public void setForgotPasswordTokenDate(Date forgotPasswordTokenDate) {
		this.forgotPasswordTokenDate = forgotPasswordTokenDate;
	}

	public String getTmpCodeForForgot() {
		return tmpCodeForForgot;
	}

	public void setTmpCodeForForgot(String tmpCodeForForgot) {
		this.tmpCodeForForgot = tmpCodeForForgot;
	}

	public String getChangePasswordToken() {
		return changePasswordToken;
	}

	public void setChangePasswordToken(String changePasswordToken) {
		this.changePasswordToken = changePasswordToken;
	}

	public Date getChangePasswordTokenDate() {
		return changePasswordTokenDate;
	}

	public void setChangePasswordTokenDate(Date changePasswordTokenDate) {
		this.changePasswordTokenDate = changePasswordTokenDate;
	}
	
	

}
