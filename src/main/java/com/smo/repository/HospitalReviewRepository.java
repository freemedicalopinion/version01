package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOHospitalReviewHistory;

@Repository
public interface HospitalReviewRepository extends
		MongoRepository<SMOHospitalReviewHistory, String> {

	public List<SMOHospitalReviewHistory> findByUserName(String userName);

}
