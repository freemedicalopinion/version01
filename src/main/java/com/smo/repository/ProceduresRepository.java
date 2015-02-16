package com.smo.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOProcedure;

@Repository
public interface ProceduresRepository extends MongoRepository<SMOProcedure, String> {
}
