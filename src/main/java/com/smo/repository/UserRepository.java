package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOUser;

@Repository
public interface UserRepository extends MongoRepository<SMOUser, String> {

	List<SMOUser> findByUsername(String username);
	
	List<SMOUser> findByRoles(List<String> roles);

	List<SMOUser> findByRegisterationApproved(boolean registerationApproved);
}
