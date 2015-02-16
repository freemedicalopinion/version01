package com.smo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smo.manager.ContactUsManager;
import com.smo.model.SMOContactUs;

@Controller
public class ContactUsController {
	@Autowired
	ContactUsManager contactUsManager;

	@RequestMapping(value = "/addContactUs", method = RequestMethod.POST)
	public String addBlog(
			@ModelAttribute("smoContactUs") SMOContactUs smoContactUs,
			HttpServletRequest request, BindingResult result) {

		contactUsManager.addContactUs(smoContactUs);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

}
