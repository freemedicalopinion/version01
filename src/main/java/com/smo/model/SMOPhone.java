package com.smo.model;

import java.util.ArrayList;
import java.util.List;

public class SMOPhone {
	private List<String> enquiryPhoneNo;
	private List<String> appointmentPhoneNo;
	private List<String> emergencyPhoneNo;
	private List<String> billingPhoneNo;
	private List<String> faxNumber;
	
	
	public void addEnqueryNo(String no) {
		if (enquiryPhoneNo == null) {
			this.enquiryPhoneNo = new ArrayList<String>();
		}
		enquiryPhoneNo.add(no);
	}

	public void addAppointmentPhoneNo(String no) {
		if (appointmentPhoneNo == null) {
			this.appointmentPhoneNo = new ArrayList<String>();
		}
		appointmentPhoneNo.add(no);
	}

	public void addfaxNumber(String no) {
		if (faxNumber == null) {
			this.faxNumber = new ArrayList<String>();
		}
		faxNumber.add(no);
	}

	public void addBillingPhoneNo(String no) {
		if (billingPhoneNo == null) {
			this.billingPhoneNo = new ArrayList<String>();
		}
		billingPhoneNo.add(no);
	}

	public void addEmergencyPhoneNo(String no) {
		if (emergencyPhoneNo == null) {
			this.emergencyPhoneNo = new ArrayList<String>();
		}
		emergencyPhoneNo.add(no);
	}

	public void addAllEnqueryNo(List<String> no) {
		if (enquiryPhoneNo == null) {
			this.enquiryPhoneNo = new ArrayList<String>();
		}
		enquiryPhoneNo.addAll(no);
	}

	public void addAllAppointmentPhoneNo(List<String> no) {
		if (appointmentPhoneNo == null) {
			this.appointmentPhoneNo = new ArrayList<String>();
		}
		appointmentPhoneNo.addAll(no);
	}

	public void addAllfaxNumber(List<String> no) {
		if (faxNumber == null) {
			this.faxNumber = new ArrayList<String>();
		}
		faxNumber.addAll(no);
	}

	public void addAllBillingPhoneNo(List<String> no) {
		if (billingPhoneNo == null) {
			this.billingPhoneNo = new ArrayList<String>();
		}
		billingPhoneNo.addAll(no);
	}

	public void addAllEmergencyPhoneNo(List<String> no) {
		if (emergencyPhoneNo == null) {
			this.emergencyPhoneNo = new ArrayList<String>();
		}
		emergencyPhoneNo.addAll(no);
	}

	public List<String> getEnquiryPhoneNo() {
		return enquiryPhoneNo;
	}
	public void setEnquiryPhoneNo(List<String> enquiryPhoneNo) {
		this.enquiryPhoneNo = enquiryPhoneNo;
	}
	public List<String> getAppointmentPhoneNo() {
		return appointmentPhoneNo;
	}
	public void setAppointmentPhoneNo(List<String> appointmentPhoneNo) {
		this.appointmentPhoneNo = appointmentPhoneNo;
	}
	public List<String> getEmergencyPhoneNo() {
		return emergencyPhoneNo;
	}
	public void setEmergencyPhoneNo(List<String> emergencyPhoneNo) {
		this.emergencyPhoneNo = emergencyPhoneNo;
	}
	public List<String> getBillingPhoneNo() {
		return billingPhoneNo;
	}
	public void setBillingPhoneNo(List<String> billingPhoneNo) {
		this.billingPhoneNo = billingPhoneNo;
	}
	public List<String> getFaxNumber() {
		return faxNumber;
	}
	public void setFaxNumber(List<String> faxNumber) {
		this.faxNumber = faxNumber;
	}
	
	
}
