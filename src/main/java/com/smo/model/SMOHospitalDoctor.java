package com.smo.model;

import java.io.Serializable;

public class SMOHospitalDoctor implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1222095735220096122L;
	
	private  String docName;
	private  String speciality;
	private  String location;
	public String getDocName() {
		return docName;
	}
	public void setDocName(String docName) {
		this.docName = docName;
	}
	public String getSpeciality() {
		return speciality;
	}
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((docName == null) ? 0 : docName.hashCode());
		result = prime * result
				+ ((location == null) ? 0 : location.hashCode());
		result = prime * result
				+ ((speciality == null) ? 0 : speciality.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SMOHospitalDoctor other = (SMOHospitalDoctor) obj;
		if (docName == null) {
			if (other.docName != null)
				return false;
		} else if (!docName.equals(other.docName))
			return false;
		if (location == null) {
			if (other.location != null)
				return false;
		} else if (!location.equals(other.location))
			return false;
		if (speciality == null) {
			if (other.speciality != null)
				return false;
		} else if (!speciality.equals(other.speciality))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "SMOHospitalDoctor [docName=" + docName + ", speciality="
				+ speciality + ", location=" + location + "]";
	}
	
	
	
	

}
