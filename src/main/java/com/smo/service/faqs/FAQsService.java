package com.smo.service.faqs;

import java.util.List;

import org.springframework.stereotype.Service;

import com.smo.model.FAQs;


public interface FAQsService {
	public void addFAQs(FAQs fAQs);
	public void removeFAQs(String id);
	public List<FAQs> getFAQsByCategory(String category);
	public FAQs getFAQsById(String id);
	public List<FAQs> getAllFAQs();
	public List<FAQs> getFAQBySubCategory(String subCategory);
}
