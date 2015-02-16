package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMODoctor;

@Repository
public interface DoctorRepository extends MongoRepository<SMODoctor, String> {
	
	public List<SMODoctor> findByUsername(String username);
	public List<SMODoctor> findByProfileName(String profileName);

}
