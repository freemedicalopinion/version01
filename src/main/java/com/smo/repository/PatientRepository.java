package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOPatient;

@Repository
public interface PatientRepository extends MongoRepository<SMOPatient, String> {
	
	List<SMOPatient> findByUsername(String userId);

}
