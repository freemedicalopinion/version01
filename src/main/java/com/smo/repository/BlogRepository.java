package com.smo.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import com.smo.model.SMOBlog;

@Repository
public interface BlogRepository extends MongoRepository<SMOBlog, String> {

	List<SMOBlog> findByContentType(String contentType);

	List<SMOBlog> findByCategory(String category, Pageable pageable);

	@Query(value = "{ 'category.category' : ?0 ,'category.subCategory':?1}")
	List<SMOBlog> findByTheCategoryAndSubCategory(String category,
			String subCategory, Pageable pageable);

	@Query(value = "{ 'category.category' : ?0 ,'summary':?1}")
	List<SMOBlog> findByCategoryAndSummary(String category, String summary);

	List<SMOBlog> findByAuthor(String author);

	Long countByCategoryAndPublish(String category ,boolean publish);

}
