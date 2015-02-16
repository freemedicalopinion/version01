package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOFeedBack;
@Repository
public interface FeedBackRepository extends MongoRepository<SMOFeedBack, String> {
	
	SMOFeedBack findById(String id);
	List<SMOFeedBack> findByEmail(String email);

}
