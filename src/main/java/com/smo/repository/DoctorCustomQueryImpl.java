package com.smo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.text.TextCriteria;
import org.springframework.data.mongodb.core.query.text.TextQuery;
import org.springframework.stereotype.Component;

import com.mongodb.DBObject;
import com.smo.constant.PublicEnums.AvgRating;
import com.smo.model.SMODoctor;
import com.smo.model.SMODoctorReviewHistory;

@Component
public class DoctorCustomQueryImpl implements DoctorCustomQuey {

	@Autowired
	MongoTemplate template;

	@Override
	public List<SMODoctor> searchDoctorTextSearch(int count, String... keyWords) {
		TextCriteria criteria = TextCriteria.forDefaultLanguage().matchingAny(
				keyWords);

		Query query = TextQuery.queryText(criteria).sortByScore()
				.with(new PageRequest(0, 5));
		// .addCriteria(Criteria.where("city").is("Noida"))
		if (count > 0) {
			query.limit(count);
		}

		List<SMODoctor> recipes = template.find(query, SMODoctor.class);
		return recipes;
	}

	@Override
	public List<SMODoctor> searchDoctorRegexSearch(String keyWord) {
		Query query = null;
		if (keyWord != null) {
			String[] keys = keyWord.split(" ");
			if (keys.length == 1) {
				query = Query.query(Criteria.where("fname").regex(keys[0]));
			} else if (keys.length >1) {
				query = Query.query(Criteria.where("fname").regex(keys[0])
						.andOperator(Criteria.where("lname").regex(keys[keys.length-1])));
			}
		}

		return template.find(query, SMODoctor.class);
	}

	@Override
	public AggregationResults<DBObject> getAverageRating(String... userId) {
		/**
		 * db.sMODoctorReviewHistory.aggregate(
		 * 
		 * { "$match": { "userName": "545b95de6382e979478ca72d" } }, { "$group":
		 * { "_id": "$avg_rating", "avg_staffRating": { "$sum": "$staffRating" }
		 * }
		 * 
		 * })
		 * */
		AggregationOperation match = Aggregation.match(Criteria.where(
				"userName").in(userId));
		AggregationOperation group = Aggregation.group("userName")
				.avg("staffRating").as(AvgRating.avg_staffRating.toString())
				.avg("helpfulnessRating")
				.as(AvgRating.avg_helpfulnessRating.toString())
				.avg("knowledgeRating")
				.as(AvgRating.avg_knowledgeRating.toString())
				.avg("punctualityRating")
				.as(AvgRating.avg_punctualityRating.toString()).count()
				.as(AvgRating.count.toString()).sum("recommend")
				.as(AvgRating.recommendation.toString());
		Aggregation aggregation = Aggregation.newAggregation(
				SMODoctorReviewHistory.class, match, group);
		AggregationResults<DBObject> result = this.template.aggregate(
				aggregation, "sMODoctorReviewHistory", DBObject.class);
		System.out.println(result.getMappedResults().toString());
		return result;
	}
}
