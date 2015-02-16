package com.smo.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.Id;

public class FAQs implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	private String question;
	private String answer;
	private String author;
	private String category;
	private List<String> subCategories = new ArrayList<String>();
	private String categoryName;
	private List<String> subCategoriesName = new ArrayList<String>();

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<String> getSubCategoriesName() {
		return subCategoriesName;
	}

	public void setSubCategoriesName(List<String> subCategoriesName) {
		this.subCategoriesName = subCategoriesName;
	}
	
	
	

	
}
