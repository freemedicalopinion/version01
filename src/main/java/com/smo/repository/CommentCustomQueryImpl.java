package com.smo.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Component;

import com.mongodb.DBObject;
import com.smo.model.SMOComment;
@Component
public class CommentCustomQueryImpl implements CommentCustomQuery {

	@Autowired
	MongoTemplate template;

	@Override
	public AggregationResults<DBObject> getCommentsCount(String... blogIds) {

		AggregationOperation match = Aggregation.match(Criteria.where(
				"contentId").in(blogIds));

		AggregationOperation group = Aggregation.group("contentId").count()
				.as("count");

		Aggregation aggregation = Aggregation.newAggregation(SMOComment.class,
				match, group);
		AggregationResults<DBObject> result = this.template.aggregate(
				aggregation, "sMOComment", DBObject.class);
		System.out.println(result.getMappedResults().toString());
		return result;
	}

}
