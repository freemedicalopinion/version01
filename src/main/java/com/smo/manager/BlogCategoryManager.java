package com.smo.manager;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOBlogCategory;
import com.smo.model.SMOBlogSubCategory;
import com.smo.service.blogCategory.BlogCategoryService;

@Component
public class BlogCategoryManager {

	@Autowired
	BlogCategoryService contentCategoryService;

	public void addContentCategory(SMOBlogCategory category) {
		if (category != null && !category.getCategory().equalsIgnoreCase("")) {
			List<SMOBlogSubCategory> subCategories = category.getSubCategory();
			if (subCategories != null) {
				Iterator<SMOBlogSubCategory> itr = subCategories.iterator();
				while (itr.hasNext()) {
					SMOBlogSubCategory sub = itr.next();
					if (!(sub != null && sub.getName() != null && !sub
							.getName().equalsIgnoreCase(""))) {
						itr.remove();
					}
				}
			}

			contentCategoryService.addCategory(category);
		}

	}

	public void removeContentCategory(String id) {
		SMOBlogCategory category = contentCategoryService
				.getAllCategoryById(id);
		if (category != null) {
			contentCategoryService.removeCategory(id);
		}

	}

	public void addKeyWord(String id, String... keyWord) {
		SMOBlogCategory category = contentCategoryService
				.getAllCategoryById(id);
		if (category != null) {
			category.setKeyWord(Arrays.asList(keyWord));
			contentCategoryService.addCategory(category);
		}
	}

	public List<SMOBlogCategory> getAllContentCategory() {
		return contentCategoryService.getAllCategory();
	}

	public SMOBlogCategory getCategoryByName(String category) {
		return contentCategoryService.getCategoryByName(category);
	}

	public SMOBlogCategory getCategoryById(String id) {
		return contentCategoryService.getAllCategoryById(id);
	}

}
