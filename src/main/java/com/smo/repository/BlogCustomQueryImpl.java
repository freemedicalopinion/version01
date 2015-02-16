package com.smo.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.text.TextCriteria;
import org.springframework.data.mongodb.core.query.text.TextQuery;
import org.springframework.stereotype.Component;

import com.smo.model.SMOBlog;
import com.smo.model.SMOComment;
import com.smo.model.SMODoctor;
import com.smo.model.SMOHospital;
import com.smo.model.SMOUser;

@Component
public class BlogCustomQueryImpl implements BlogCustomQuery {
	@Autowired
	MongoTemplate template;

	@Override
	public List<SMOBlog> searchByText(String summary, int page, int size) {

		TextCriteria criteria = TextCriteria.forDefaultLanguage().matchingAny(
				summary);
		Query query = null;

		if (size == 0) {
			query = TextQuery.queryText(criteria).sortByScore();
		} else {
			query = TextQuery.queryText(criteria).sortByScore()
					.with(new PageRequest(page, size));
		}

		List<SMOBlog> recipes = template.find(query, SMOBlog.class);
		return recipes;
	}

	public List<SMOBlog> searchByRegex(String keyWord, int page, int size) {
		Query query=null;
		if (size == 0) {
			query = Query.query(Criteria.where("blogTitle").regex(keyWord))
					.addCriteria(Criteria.where("summary").regex(keyWord))
					.addCriteria(Criteria.where("keyWords").regex(keyWord));
		} else {
			query = Query.query(Criteria.where("blogTitle").regex(keyWord))
					.addCriteria(Criteria.where("summary").regex(keyWord))
					.addCriteria(Criteria.where("keyWords").regex(keyWord))
					.with(new PageRequest(page, size));
		}

		return template.find(query, SMOBlog.class);
	}

	@Override
	public Map<String, SMOBlog> getContentForBlogHomePage(
			List<String> categories) {

		Map<String, SMOBlog> latest = new HashMap<String, SMOBlog>();
		if (categories != null) {
			for (String category : categories) {
				Query query = new Query();
				query.addCriteria(Criteria.where("category").in(category)
						.andOperator(Criteria.where("publish").is(true)));
				query.with(new Sort(Sort.Direction.DESC, "createdDate"));
				SMOBlog recipes = template.findOne(query, SMOBlog.class);
				if (recipes != null) {
					latest.put(category, recipes);
				}

			}

		}

		return latest;
	}

	@Override
	public List<SMOBlog> getContentForBlogCategoryPage(String category,
			int page, int size) {

		Query query = new Query();
		query.addCriteria(Criteria.where("category").in(category)
				.andOperator(Criteria.where("publish").is(true)));
		query.with(new PageRequest(page, size, new Sort(Sort.Direction.DESC,
				"createdDate")));
		return template.find(query, SMOBlog.class);

	}

	public List<SMOBlog> getContentForBlogCategoryPage(String category, int size) {

		Query query = new Query();
		query.addCriteria(Criteria.where("category").in(category)
				.andOperator(Criteria.where("publish").is(true)));
		query.limit(size);
		query.with(new Sort(Sort.Direction.DESC, "createdDate"));
		return template.find(query, SMOBlog.class);

	}

	@Override
	public List<SMODoctor> getLatestDoctors(int limit) {
		Query query = new Query();

		query.with(new Sort(Sort.Direction.DESC, "id"));
		query.limit(limit);
		return template.find(query, SMODoctor.class);
	}

	@Override
	public List<SMOBlog> getLatestContentByType(String type, int limit) {
		// TODO Auto-generated method stub
		Query query = new Query();
		/*
		 * query.addCriteria(Criteria.where("type").in(type)
		 * .andOperator(Criteria.where("publish").is(true)));
		 */
		query.addCriteria(Criteria.where("publish").is(true));
		query.with(new Sort(Sort.Direction.DESC, "createdDate"));
		query.limit(limit);
		return template.find(query, SMOBlog.class);
	}

	@Override
	public List<SMOHospital> getLatestHospitals(int limit) {

		Query query = new Query();
		query.with(new Sort(Sort.Direction.DESC, "id"));
		query.limit(limit);
		return template.find(query, SMOHospital.class);

	}

	@Override
	public List<SMOUser> getUsersByRoles(List<String> roles, int limit) {
		// TODO Auto-generated method stub
		Query query = new Query();
		query.addCriteria(Criteria
				.where("roles")
				.in(roles)
				.andOperator(
						Criteria.where("accountNonExpired")
								.is(true)
								.andOperator(
										Criteria.where("accountNonLocked")
												.is(true)
												.andOperator(
														Criteria.where(
																"registerationApproved")
																.is(true)))));
		query.with(new Sort(Sort.Direction.DESC, "createdDate"));
		query.limit(limit);
		return template.find(query, SMOUser.class);
	}

	@Override
	public List<SMOBlog> getLatestBlogByAuthor(String author, int count) {
		Query query = new Query();
		query.with(new Sort(Sort.Direction.DESC, "createdDate"));
		query.limit(count);
		return template.find(query, SMOBlog.class);
	}

	@Override
	public List<SMOComment> getLatestComment(int limit) {
		// TODO Auto-generated method stub
				Query query = new Query();
				/*
				 * query.addCriteria(Criteria.where("type").in(type)
				 * .andOperator(Criteria.where("publish").is(true)));
				 */
				
				query.with(new Sort(Sort.Direction.DESC, "id"));
				query.limit(limit);
				return template.find(query, SMOComment.class);
	}

}
