package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOSearch;

@Repository
public interface SearchRepository extends MongoRepository<SMOSearch, String> {

	List<SMOSearch> findByQuery(String query);

}
