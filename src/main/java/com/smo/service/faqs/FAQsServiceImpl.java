package com.smo.service.faqs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.FAQs;
import com.smo.repository.FAQsRepository;
@Service
public class FAQsServiceImpl implements FAQsService {

	@Autowired
	FAQsRepository faQsRepository;
	
	@Override
	public void addFAQs(FAQs fAQs) {
		faQsRepository.save(fAQs);
	}

	@Override
	public List<FAQs> getFAQsByCategory(String category) {
		List<FAQs> listOfFAQsByCategory = faQsRepository.findByCategory(category);
		return listOfFAQsByCategory;
	}

	@Override
	public FAQs getFAQsById(String id) {
		FAQs fAQsObjById = faQsRepository.findById(id);
		return fAQsObjById;
	}

	@Override
	public List<FAQs> getAllFAQs() {
		List<FAQs> listOfAllFAQs = faQsRepository.findAll();
		return listOfAllFAQs;
	}

	@Override
	public void removeFAQs(String id) {
		faQsRepository.delete(id);
		
	}

	@Override
	public List<FAQs> getFAQBySubCategory(String subCategories) {
		return faQsRepository.findBySubCategories(subCategories);
	}

}
