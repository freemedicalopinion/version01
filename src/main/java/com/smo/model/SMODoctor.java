package com.smo.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.TextIndexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.TextScore;

@Document
public class SMODoctor implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4002384425307716742L;
	@Id
	private String id;
	// userName
	private String username;
	private String profileName;
	@TextIndexed
	private String fname;
	@TextIndexed
	private String lname;
	private String aboutMe;
	private String mobile;
	private String city;
	private String gender;
	private SMOSocialMedia social;
	private String websiteURL;
	private List<SMOEducation> education;
	
	private List<SMOExperience> experiences;
	List<SMOAwards> awards;
	private List<String> specilities;
	private List<String> procedures;
	private List<String> condition;
	private List<String> tags;
	private List<String> keyWords;
	private List<SMODoctorTiming> hospitals;
	private List<SMODoctorRegistration> doctorRegistration;

	@TextScore
	Float score;

	public void addDoctorRegistration(SMODoctorRegistration doctorRegistration) {
		if (this.doctorRegistration == null) {
			this.doctorRegistration = new ArrayList<SMODoctorRegistration>();
		}
		this.doctorRegistration.add(doctorRegistration);
	}

	public void addHospital(SMODoctorTiming doctorTiming) {
		if (this.hospitals == null) {
			this.hospitals = new ArrayList<SMODoctorTiming>();
		}
		this.hospitals.add(doctorTiming);
	}

	public void addKeyWord(String keyWord) {
		if (this.keyWords == null) {
			this.keyWords = new ArrayList<String>();
		}
		this.keyWords.add(keyWord);
	}

	public void removeKeyWord(String keyWord) {
		if (this.keyWords != null && this.keyWords.contains(keyWord)) {
			this.keyWords.remove(keyWord);
		}
	}

	public void addEducation(SMOEducation education) {
		if (this.education == null) {
			this.education = new ArrayList<SMOEducation>();
		}
		this.education.add(education);
	}

	public void addAwards(SMOAwards award) {
		if (this.awards == null) {
			this.awards = new ArrayList<SMOAwards>();
		}
		this.awards.add(award);
	}

	public void addExperiences(SMOExperience experience) {
		if (this.experiences == null) {
			this.experiences = new ArrayList<SMOExperience>();
		}
		this.experiences.add(experience);
	}

	public void addAllSpecilities(List<String> specilites) {
		if (this.specilities == null) {
			this.specilities = new ArrayList<String>();
		}
		this.specilities.addAll(specilites);
	}

	public void addSpecility(String specility) {
		if (this.specilities == null) {
			this.specilities = new ArrayList<String>();
		}
		this.specilities.add(specility);
	}

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

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public List<SMOEducation> getEducation() {
		return education;
	}

	public void setEducation(List<SMOEducation> education) {
		this.education = education;
	}
	public List<SMOExperience> getExperiences() {
		return experiences;
	}

	public void setExperiences(List<SMOExperience> experiences) {
		this.experiences = experiences;
	}

	public List<String> getSpecilities() {
		return specilities;
	}

	public void setSpecilities(List<String> specilities) {
		this.specilities = specilities;
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

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public List<SMOAwards> getAwards() {
		return awards;
	}

	public void setAwards(List<SMOAwards> awards) {
		this.awards = awards;
	}

	public List<SMODoctorTiming> getHospitals() {
		return hospitals;
	}

	public void setHospitals(List<SMODoctorTiming> hospitals) {
		this.hospitals = hospitals;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public SMOSocialMedia getSocial() {
		return social;
	}

	public void setSocial(SMOSocialMedia social) {
		this.social = social;
	}

	public String getWebsiteURL() {
		return websiteURL;
	}

	public void setWebsiteURL(String websiteURL) {
		this.websiteURL = websiteURL;
	}

	public List<SMODoctorRegistration> getDoctorRegistration() {
		return doctorRegistration;
	}

	public void setDoctorRegistration(
			List<SMODoctorRegistration> doctorRegistration) {
		this.doctorRegistration = doctorRegistration;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}
	

}
