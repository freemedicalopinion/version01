package com.smo.service.hospital;

import java.util.List;

import org.springframework.data.mongodb.core.aggregation.AggregationResults;

import com.mongodb.DBObject;
import com.smo.model.SMOHospital;

public interface HospitalService {

	public void addHospital(SMOHospital hospital);

	public SMOHospital getHospitalByName(String hospital);

	public SMOHospital getHospitalById(String id);
	public List<SMOHospital> getHospitals(List<String> hospitals);

	public List<SMOHospital> findAllHospiital();

	public List<SMOHospital> getLatestHospitals(int limit);

	public int getTotalCount();

	public List<SMOHospital> getHospitalByTextSearch(int count, String... keyWords);

	public List<SMOHospital> getHospitalByRegexSearch(String keyWord);
	public AggregationResults<DBObject> getAverageRating(String... userId);
	
}
