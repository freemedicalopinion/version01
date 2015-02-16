package com.smo.service.doctor;

import java.util.List;

import org.springframework.data.mongodb.core.aggregation.AggregationResults;

import com.mongodb.DBObject;
import com.smo.model.SMODoctor;

public interface DoctorService {

	public void addDoctor(SMODoctor doc);
	public SMODoctor getDoctorByUsername(String username);
	public SMODoctor getDoctorByProfileName(String profileName);
	public SMODoctor getDoctorById(String id);
	public List<SMODoctor> searchDoctorTextSearch(int limit,String... keyWords);
	public List<SMODoctor> searchDoctorRegexSearch(String keyWord);
	public List<SMODoctor> getLatestDoctorsByLimit(int limit);
	public int getTotalCount();
	public AggregationResults<DBObject> getAverageRating(String... userId);
}
