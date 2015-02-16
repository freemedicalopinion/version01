package com.smo.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class SMOSpecility implements Serializable{

	private static final long serialVersionUID = -337092591341751830L;
	
	@Id
	private String id;
	private String specilityName;
	private String description;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSpecilityName() {
		return specilityName;
	}
	public void setSpecilityName(String specilityName) {
		this.specilityName = specilityName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	

}
