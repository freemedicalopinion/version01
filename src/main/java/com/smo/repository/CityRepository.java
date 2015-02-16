package com.smo.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOCity;

@Repository
public interface CityRepository extends MongoRepository<SMOCity, String> {
}
