package com.smo.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.FAQs;
import com.smo.service.faqs.FAQsService;
import com.smo.utility.SMOException;

@Component
public class FAQsManager {
	@Autowired
	FAQsService faQsService;

	public void addFAQs(FAQs faQsModelObj) throws SMOException {

		if (faQsModelObj.getId() != null
				&& faQsModelObj.getId().equalsIgnoreCase("")) {
			faQsModelObj.setId(null);

		}
		if (faQsModelObj.getId() != null
				&& !faQsModelObj.getId().equalsIgnoreCase("")) {
			FAQs faq = getFAQById(faQsModelObj.getId());
			if (faq == null) {
				throw new SMOException();
			}
		}
		faQsService.addFAQs(faQsModelObj);
	}

	public List<FAQs> getAllFAQs() {
		return faQsService.getAllFAQs();
	}

	public void removeFAQ(String id) {
		FAQs faq = getFAQById(id);
		if (faq != null) {
			faQsService.removeFAQs(id);
		}

	}

	public FAQs getFAQById(String id) {
		return faQsService.getFAQsById(id);
	}

	public void editFAQ(FAQs faQs) {

		if (faQs != null) {

			faQsService.addFAQs(faQs);
		}

	}
	public List<FAQs> getFAQBySubCategory(String subCategories) {
		return faQsService.getFAQBySubCategory(subCategories);
	}

}
