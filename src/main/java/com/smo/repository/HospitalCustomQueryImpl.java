package com.smo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
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
import com.smo.model.SMODoctorReviewHistory;
import com.smo.model.SMOHospital;
import com.smo.model.SMOHospitalReviewHistory;

@Component
public class HospitalCustomQueryImpl implements HospitalCustomQuey {

	@Autowired
	MongoTemplate template;

	@Override
	public List<SMOHospital> searchHospitalTextSearch(int count, String... keyWords) {
		TextCriteria criteria = TextCriteria.forDefaultLanguage().matchingAny(
				keyWords);
		
		Query query = TextQuery.queryText(criteria).sortByScore()
				.with(new PageRequest(0, 5));
		if (count > 0) {
			query.limit(count);
		}
		List<SMOHospital> recipes = template.find(query, SMOHospital.class);
		return recipes;
	}

	@Override
	public List<SMOHospital> searchHospitalRegexSearch(String keyWord) {
		Criteria criteria = Criteria.where("name").regex(keyWord);
		Query query = Query.query(criteria);
		return template.find(query, SMOHospital.class);
	}

	@Override
	public List<SMOHospital> getHospitals(List<String> hospitals) {
		Criteria criteria = Criteria.where("id").in(hospitals);
		Query query = Query.query(criteria);
		return template.find(query, SMOHospital.class);
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
				.avg("cleanliness").as(AvgRating.avg_staffRating.toString())
				.avg("facilities")
				.as(AvgRating.avg_helpfulnessRating.toString())
				.avg("services")
				.as(AvgRating.avg_knowledgeRating.toString())
				.avg("value")
				.as(AvgRating.avg_punctualityRating.toString()).count()
				.as(AvgRating.count.toString()).sum("recommend")
				.as(AvgRating.recommendation.toString());
		Aggregation aggregation = Aggregation.newAggregation(
				SMOHospitalReviewHistory.class, match, group);
		AggregationResults<DBObject> result = this.template.aggregate(
				aggregation, "sMOHospitalReviewHistory", DBObject.class);
		System.out.println(result.getMappedResults().toString());
		return result;
	}
}
