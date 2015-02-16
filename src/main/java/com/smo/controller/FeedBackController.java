package com.smo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smo.manager.FeedBackManager;
import com.smo.model.SMOFeedBack;

@Controller
public class FeedBackController {
	@Autowired
	FeedBackManager feedBackManager;

	@RequestMapping(value = "/addFeedBack", method = RequestMethod.POST)
	public String addFeedBack(@Param("name") String name,
			@Param("email") String email, @Param("message") String message) {
		SMOFeedBack smoFeedBack = new SMOFeedBack();
		smoFeedBack.setEmail(email);
		smoFeedBack.setFeedback(message);
		smoFeedBack.setName(name);
		
		feedBackManager.addFeedBack(smoFeedBack);
		return "Feed Back added Successfully";
	}
}
