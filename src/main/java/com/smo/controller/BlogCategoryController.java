package com.smo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.smo.manager.BlogCategoryManager;
import com.smo.model.SMOBlogCategory;

@Controller
public class BlogCategoryController {

	@Autowired
	BlogCategoryManager categoryManager;

	@RequestMapping("/secure/manageContentCategory")
	public ModelAndView getAllContentCategory() throws Exception {
		List<SMOBlogCategory> contentCategories = categoryManager
				.getAllContentCategory();

		ModelAndView m = new ModelAndView();
		Gson g = new Gson();
		m.addObject("contentCategories", contentCategories);
		m.addObject("contentCategoriesJson", g.toJson(contentCategories));
		m.addObject("categoryObj", new SMOBlogCategory());
		m.setViewName("secure/managerContentCategory");
		return m;
	}

	@RequestMapping(value = "/secure/removeContentCategory", method = RequestMethod.POST)
	public String removeContentCategory(@Param("id") String id)
			throws Exception {
		categoryManager.removeContentCategory(id);
		return "redirect:manageContentCategory";
	}

	@RequestMapping(value = "/secure/addContentCategory", method = RequestMethod.POST)
	public String addContentCategory(
			@ModelAttribute("categoryObj") SMOBlogCategory categoryObj,
			HttpServletRequest request, BindingResult result) throws Exception {
		categoryManager.addContentCategory(categoryObj);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}
	@RequestMapping(value = "/secure/addKeyword", method = RequestMethod.POST)
	public String addKeyword(@Param("keyWords") String keyWords,@Param("id") String id,HttpServletRequest request)
			throws Exception {
		if(keyWords!=null){
			categoryManager.addKeyWord(id, keyWords.split("@@@"));
		}
			String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}
	
}
