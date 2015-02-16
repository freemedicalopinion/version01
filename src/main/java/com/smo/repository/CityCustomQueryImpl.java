package com.smo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.text.TextCriteria;
import org.springframework.data.mongodb.core.query.text.TextQuery;
import org.springframework.stereotype.Component;

import com.smo.model.SMOCity;
@Component
public class CityCustomQueryImpl implements CityCustomQuery {
	@Autowired
	MongoTemplate template;

	@Override
	public List<SMOCity> searchByText(String keyWord) {
		TextCriteria criteria = TextCriteria.forDefaultLanguage().matching(
				keyWord);

		Query query = TextQuery.queryText(criteria).sortByScore()
				.with(new PageRequest(0, 5));
		// .addCriteria(Criteria.where("city").is("Noida"))

		List<SMOCity> recipes = template.find(query, SMOCity.class);
		return recipes;
	}

	@Override
	public List<SMOCity> searchByRegex(String keyWord) {
		Query query = null;
		query = Query.query(Criteria.where("city").regex(keyWord));

		return template.find(query, SMOCity.class);
	}

}
