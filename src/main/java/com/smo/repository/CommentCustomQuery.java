package com.smo.repository;

import org.springframework.data.mongodb.core.aggregation.AggregationResults;

import com.mongodb.DBObject;

public interface CommentCustomQuery {
	public AggregationResults<DBObject> getCommentsCount(String... blogIds);

}
