package com.smo.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smo.manager.CommentManager;
import com.smo.model.SMOComment;

@Controller
public class CommonCommentController {
	@Autowired
	CommentManager commentManager;

	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("comment") SMOComment comment,
			HttpServletRequest request, BindingResult result) {
		comment.setCreatedDate(new Date());
		commentManager.addComment(comment);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}
}
