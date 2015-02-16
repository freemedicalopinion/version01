package com.smo.service.blogCategory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOBlogCategory;
import com.smo.repository.BlogCategoryRepository;

@Service
public class BlogCategoryServiceImpl implements BlogCategoryService {

	@Autowired
	BlogCategoryRepository contentCategoryRepository;

	@Override
	public void addCategory(SMOBlogCategory category) {
		contentCategoryRepository.save(category);
	}

	@Override
	public void removeCategory(String id) {

		List<SMOBlogCategory> sMOContentCategory = contentCategoryRepository
				.findById(id);
		if (sMOContentCategory != null) {
			contentCategoryRepository.delete(sMOContentCategory.get(0));
		}

	}

	@Override
	public List<SMOBlogCategory> getAllCategory() {

		return contentCategoryRepository.findAll();
	}

	@Override
	public SMOBlogCategory getAllCategoryById(String id) {
		List<SMOBlogCategory> categories = contentCategoryRepository
				.findById(id);
		if (categories != null && categories.size()>0) {
			return categories.get(0);
		}
		return null;
	}

	@Override
	public SMOBlogCategory getCategoryByName(String category) {
		List<SMOBlogCategory> categories = contentCategoryRepository
				.findByCategory(category);
		if (categories != null) {
			return categories.get(0);
		} else
			return null;
	}

}
