package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.core.aggregation.AggregationResults;

import com.mongodb.DBObject;
import com.smo.model.SMOHospital;

public interface HospitalCustomQuey {

	List<SMOHospital> searchHospitalTextSearch(int count, String... keyWords);

	List<SMOHospital> searchHospitalRegexSearch(String keyWord);
	public List<SMOHospital> getHospitals(List<String> hospitals);
	public AggregationResults<DBObject> getAverageRating(String... userId);

}
