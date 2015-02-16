package com.smo.service.contactUs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOContactUs;
import com.smo.repository.ContactUsRepository;

@Service
public class ContactUsServiceImpl implements ContactUsService {

	@Autowired
	ContactUsRepository contactUsRepository;

	@Override
	public void save(SMOContactUs contactUs) {
		contactUsRepository.save(contactUs);

	}

}
