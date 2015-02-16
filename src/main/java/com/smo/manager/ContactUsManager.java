package com.smo.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOContactUs;
import com.smo.service.contactUs.ContactUsService;

@Component
public class ContactUsManager {
	@Autowired
	ContactUsService contactUsService;

	public void addContactUs(SMOContactUs contactUs) {
		contactUsService.save(contactUs);

	}

}
