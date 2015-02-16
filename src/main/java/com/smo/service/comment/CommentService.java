package com.smo.service.comment;

import java.util.List;

import org.springframework.data.mongodb.core.aggregation.AggregationResults;

import com.mongodb.DBObject;
import com.smo.model.SMOComment;

public interface CommentService {

	public void saveComment(SMOComment comment);

	public List<SMOComment> getCommentByContentId(String contentId);
	public List<SMOComment> getLatestComment(int count);
	public AggregationResults<DBObject> getCommentCount(String... blogIds);

}
