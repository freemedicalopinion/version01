package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.smo.model.SMOContactUs;

public interface ContactUsRepository extends
		MongoRepository<SMOContactUs, String> {

	public List<SMOContactUs> findById(String id);

}
