package com.smo.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.TextIndexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.TextScore;

@Document
public class SMOHospital implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -9160006869455236183L;
	@Id
	private String id;
	private String username;
	@TextIndexed
	private String name;
	private String aboutUs;
	@TextIndexed
	private List<String> services = new ArrayList<String>();
	private List<SMOAwards> awards = new ArrayList<SMOAwards>();
	@TextIndexed
	private List<String> specilities = new ArrayList<String>();
	private List<String> tags = new ArrayList<String>();
	private List<String> keyWords = new ArrayList<String>();
	private SMOContact contact;
	private SMOPhone phone;
	private List<SMOHospitalDoctor> hospitalDoctors = new ArrayList<SMOHospitalDoctor>();
	private List<String> paymentMethod = new ArrayList<String>();
	@TextIndexed
	private List<String> procedures;
	@TextIndexed
	private List<String> condition;
	private String websiteUrl;
	private SMOSocialMedia social;
	@TextScore
	Float score;

	public void addAllProcedures(List<String> procedures) {
		if (this.procedures == null) {
			this.procedures = new ArrayList<String>();
		}
		this.procedures.addAll(procedures);
	}

	public void addProcedure(String procedure) {
		if (this.procedures == null) {
			this.procedures = new ArrayList<String>();
		}
		this.procedures.add(procedure);
	}

	public void addAllConditions(List<String> conditions) {
		if (this.condition == null) {
			this.condition = new ArrayList<String>();
		}
		this.condition.addAll(conditions);
	}

	public void addService(String service) {
		this.services.add(service);
	}

	public void addAllService(List<String> services) {
		this.services.addAll(services);
	}

	public void removeService(String service) {
		if (this.services.contains(service)) {
			this.services.remove(service);
		}
	}

	public void addAwards(SMOAwards awards) {
		this.awards.add(awards);
	}

	public void addAllSpecilities(List<String> specilites) {
		this.specilities.addAll(specilites);
	}

	public void addSpecility(String specility) {
		this.specilities.add(specility);
	}

	public SMOContact getContact() {
		return contact;
	}

	public void setContact(SMOContact contact) {
		this.contact = contact;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	public List<SMOAwards> getAwards() {
		return awards;
	}

	public void setAwards(List<SMOAwards> awards) {
		this.awards = awards;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAboutUs() {
		return aboutUs;
	}

	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}

	public List<String> getServices() {
		return services;
	}

	public void setServices(List<String> services) {
		this.services = services;
	}

	public List<String> getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(List<String> paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	
	public List<String> getTags() {
		return tags;
	}

	public void setTags(List<String> tags) {
		this.tags = tags;
	}

	public List<String> getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(List<String> keyWords) {
		this.keyWords = keyWords;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<String> getSpecilities() {
		return specilities;
	}

	public void setSpecilities(List<String> specilities) {
		this.specilities = specilities;
	}

	public List<SMOHospitalDoctor> getHospitalDoctors() {
		return hospitalDoctors;
	}

	public void setHospitalDoctors(List<SMOHospitalDoctor> hospitalDoctors) {
		this.hospitalDoctors = hospitalDoctors;
	}

	public List<String> getProcedures() {
		return procedures;
	}

	public void setProcedures(List<String> procedures) {
		this.procedures = procedures;
	}

	public List<String> getCondition() {
		return condition;
	}

	public void setCondition(List<String> condition) {
		this.condition = condition;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public SMOSocialMedia getSocial() {
		return social;
	}

	public void setSocial(SMOSocialMedia social) {
		this.social = social;
	}

	public SMOPhone getPhone() {
		return phone;
	}

	public void setPhone(SMOPhone phone) {
		this.phone = phone;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

}
