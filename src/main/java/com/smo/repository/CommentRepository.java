package com.smo.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.smo.model.SMOComment;

public interface CommentRepository extends MongoRepository<SMOComment, String> {
	
	List<SMOComment> findByContentId(String contentId);
	List<SMOComment> findByCreatedDate(String contentId,Pageable pageable);

}
