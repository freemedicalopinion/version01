package com.smo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.smo.model.FAQs;

@Repository
public interface FAQsRepository extends MongoRepository<FAQs, String> {
	FAQs findById(String id);

	List<FAQs> findByCategory(String category);
	List<FAQs> findBySubCategories(String subCategories);
}
