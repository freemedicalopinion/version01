package com.smo.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class SMOBlogCategory implements Serializable {
	public SMOBlogCategory() {

	}

	public SMOBlogCategory(String category) {
		this.category = category;
	}

	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String category;
	private String decription;

	private List<SMOBlogSubCategory> subCategory = new ArrayList<SMOBlogSubCategory>();
	private List<String> keyWord;

	public void addKeyWord(String... keyWordFromUi) {
		if (keyWord == null) {
			keyWord = new ArrayList<String>();

		}
		keyWord.addAll(Arrays.asList(keyWordFromUi));
	}

	public void addSubCategory(SMOBlogSubCategory subCategory) {
		this.subCategory.add(subCategory);
	}

	public void addSubCategories(List<SMOBlogSubCategory> subCategory) {
		this.subCategory.addAll(subCategory);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDecription() {
		return decription;
	}

	public void setDecription(String decription) {
		this.decription = decription;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<SMOBlogSubCategory> getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(List<SMOBlogSubCategory> subCategory) {
		this.subCategory = subCategory;
	}

	public List<String> getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(List<String> keyWord) {
		this.keyWord = keyWord;
	}

}
