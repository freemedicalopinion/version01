package com.smo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.smo.manager.InternalLoginManager;

@Controller
public class InternaluserLoginController {

	@Autowired
	InternalLoginManager internalLoginManager;

	@RequestMapping(value = "/secure/internalUserLogin", method = RequestMethod.GET)
	public ModelAndView internalLoginPage() {
		ModelAndView m = new ModelAndView();

		m.setViewName("secure/internalUserLogin");
		return m;

	}

	@RequestMapping(value = "/secure/internalUserLogin", method = RequestMethod.POST)
	public String loginToUser(@Param("username") String username,
			HttpServletRequest request) {

		internalLoginManager.login(request, username);
		return "redirect:welcome";

	}

	@RequestMapping(value = "/secure/loginasAdmin", method = RequestMethod.GET)
	public String loginToAdmin() {
		internalLoginManager.logoutFromInternalUser();
		return "redirect:/secure/internalUserLogin";

	}

}
