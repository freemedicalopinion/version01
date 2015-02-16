package com.smo.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOSpecility;

@Repository
public interface SpecilityRepository extends MongoRepository<SMOSpecility, String> {
}
