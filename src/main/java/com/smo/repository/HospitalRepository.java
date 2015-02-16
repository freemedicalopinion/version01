package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOHospital;

@Repository
public interface HospitalRepository extends MongoRepository<SMOHospital, String> {
	
	public List<SMOHospital> findByUsername(String username);
	public SMOHospital findOne(String id);
	

}
