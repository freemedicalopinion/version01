package com.smo.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.mongodb.core.aggregation.AggregationResults;

import com.mongodb.DBObject;
import com.smo.model.SMOBlog;
import com.smo.model.SMOComment;
import com.smo.model.SMODoctor;
import com.smo.model.SMOHospital;
import com.smo.model.SMOUser;

public interface BlogCustomQuery {
	
	public List<SMOBlog> searchByText(String summary,int page ,int size);
	public List<SMOBlog> searchByRegex(String keyWord,int page ,int size);
	
	public Map<String,SMOBlog> getContentForBlogHomePage(List<String> categories);
	public List<SMOBlog> getContentForBlogCategoryPage(
			String category , int page,int size);
	public List<SMOBlog> getContentForBlogCategoryPage(
			String category ,int size);
	
	public List<SMOBlog> getLatestContentByType(
			String type , int limit);
	
	public List<SMOComment> getLatestComment(int limit);
	
	public List<SMODoctor> getLatestDoctors(int limit);
	
	public List<SMOHospital> getLatestHospitals(int limit);
	
	public List<SMOUser> getUsersByRoles(List<String> roles, int limit);
	public List<SMOBlog> getLatestBlogByAuthor(String author , int count);
	

}
