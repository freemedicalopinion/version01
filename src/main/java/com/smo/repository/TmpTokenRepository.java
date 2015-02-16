package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOTmpToken;

@Repository
public interface TmpTokenRepository extends
		MongoRepository<SMOTmpToken, String> {
	
	List<SMOTmpToken> findByUserId(String userId);

}
