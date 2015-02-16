package com.smo.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class SMOBlog extends SMOContent {

	private static final long serialVersionUID = 1L;
	/**
	 * category=> List of subcategories
	 * */
	private String category;
	private List<String> subCategories = new ArrayList<String>();

	public void addSubCategory(String subCategory) {
		this.subCategories.add(subCategory);
	}

	public void addSubCategories(List<String> subCategory) {
		this.subCategories.addAll(subCategory);
	}

	public void removeSubCategory(String subCategory) {
		if (this.subCategories.contains(subCategory)) {
			this.subCategories.remove(subCategory);
		}
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<String> getSubCategories() {
		return subCategories;
	}

	public void setSubCategories(List<String> subCategories) {
		this.subCategories = subCategories;
	}

}
