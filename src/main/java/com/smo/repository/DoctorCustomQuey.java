package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.core.aggregation.AggregationResults;

import com.mongodb.DBObject;
import com.smo.model.SMODoctor;

public interface DoctorCustomQuey {

	List<SMODoctor> searchDoctorTextSearch(int count,String... keyWords);

	List<SMODoctor> searchDoctorRegexSearch(String keyWord);
	public AggregationResults<DBObject> getAverageRating(String... userId);

}
