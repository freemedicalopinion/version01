package com.smo.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOCondition;

@Repository
public interface ConditionRepository extends
		MongoRepository<SMOCondition, String> {
}
