package com.smo.service.blogCategory;

import java.util.List;

import org.springframework.stereotype.Service;

import com.smo.model.SMOBlogCategory;

@Service
public interface BlogCategoryService {

	public void addCategory(SMOBlogCategory category);

	public void removeCategory(String id);

	public List<SMOBlogCategory> getAllCategory();

	public SMOBlogCategory getAllCategoryById(String id);
	
	public SMOBlogCategory getCategoryByName(String category);

}
