package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMODoctorReviewHistory;

@Repository
public interface DoctorReviewRepository extends
		MongoRepository<SMODoctorReviewHistory, String> {
	
	public List<SMODoctorReviewHistory> findByUserName(String userName);

}
