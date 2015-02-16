package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOBlogCategory;

@Repository
public interface BlogCategoryRepository extends
		MongoRepository<SMOBlogCategory, String> {

	public List<SMOBlogCategory> findById(String id);

	public List<SMOBlogCategory> findByCategory(String category);
	

}
