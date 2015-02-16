package com.smo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.smo.manager.BlogCategoryManager;
import com.smo.manager.FAQsManager;
import com.smo.model.FAQs;
import com.smo.model.SMOBlogCategory;
import com.smo.model.SMOBlogSubCategory;
import com.smo.utility.SMOException;

@Controller
public class FAQsController {

	/**
	 * This controller class is for managing FAQs 1) Add FAQs 2) Edit FAQs 3)
	 * Delete FAQs
	 * */

	@Autowired
	FAQsManager faQsManager;
	@Autowired
	BlogCategoryManager blogCategoryManager;

	@RequestMapping(value = "/secure/manageFAQs", method = RequestMethod.GET)
	public ModelAndView renderFAQsList(
			@RequestParam(value = "filter", required = false) String filter) {
		List<FAQs> listOfAllFAQs = faQsManager.getAllFAQs();
		List<SMOBlogCategory> categories = blogCategoryManager
				.getAllContentCategory();
		Map<String, Integer> categoryFaqCount = new HashMap<String, Integer>();
		Map<String, SMOBlogCategory> categoryIdNameObject = new HashMap<String, SMOBlogCategory>();
		List<FAQs> outputFaq = new ArrayList<FAQs>();
		if (categories != null) {
			for (SMOBlogCategory c : categories) {
				categoryFaqCount.put(c.getCategory(), 0);
				categoryIdNameObject.put(c.getId(), c);
			}
		}
		if (listOfAllFAQs != null) {
			for (FAQs faq : listOfAllFAQs) {
				if (categoryIdNameObject.containsKey(faq.getCategory())) {
					SMOBlogCategory c = categoryIdNameObject.get(faq
							.getCategory());
					faq.setCategoryName(c.getCategory());
					if (categoryFaqCount.containsKey(c.getCategory())) {
						int count = categoryFaqCount.get(c.getCategory());
						categoryFaqCount.put(c.getCategory(), count + 1);
					}

					if (faq.getSubCategories() != null
							&& c.getSubCategory() != null) {
						List<String> sub = faq.getSubCategories();
						List<String> finalSubCategory = new ArrayList<String>();
						for (SMOBlogSubCategory subCategory : c
								.getSubCategory()) {
							if (sub.contains(subCategory.getId())) {
								finalSubCategory.add(subCategory.getName());
							}
						}
						faq.setSubCategoriesName(finalSubCategory);
					}
				}
				if (filter != null && categoryFaqCount.containsKey(filter)
						&& faq.getCategoryName().equalsIgnoreCase(filter)) {
					outputFaq.add(faq);
				}

			}
		}
		if (filter == null || !categoryFaqCount.containsKey(filter)
				|| filter.equalsIgnoreCase("all")) {
			outputFaq.addAll(listOfAllFAQs);
		}

		Gson g = new Gson();
		String categoriesJson = g.toJson(categories);

		String allFaqJson = g.toJson(outputFaq);
		ModelAndView m = new ModelAndView();
		m.addObject("faQs", new FAQs());
		m.addObject("listOfAllFAQs", outputFaq);
		m.addObject("categories", categoriesJson);
		m.addObject("cattegoryAndCouunt", categoryFaqCount);
		m.addObject("allFaqJson", allFaqJson);
		m.setViewName("secure/manageFAQs");
		return m;
	}

	@RequestMapping(value = "/secure/addFAQs", method = RequestMethod.POST)
	public String addFAQs(@ModelAttribute("faQs") FAQs faQs,
			BindingResult result, HttpServletRequest request)
			throws SMOException {
		faQsManager.addFAQs(faQs);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = "/secure/removeFAQ", method = RequestMethod.POST)
	public String removeFAQ(@Param("id") String id) {
		faQsManager.removeFAQ(id);
		return "redirect:manageFAQs";
	}
	

	@RequestMapping(value = "/faq/{category}/{subcategory}", method = RequestMethod.GET)
	public ModelAndView faqPage(@PathVariable("category") String category,
			@PathVariable("subcategory") String subcategory) {
		List<FAQs> listOfAllFAQs = null;
		List<SMOBlogCategory> categories = blogCategoryManager
				.getAllContentCategory();
		if(categories!=null){
			for (SMOBlogCategory categoryObj : categories) {
				if (category.equalsIgnoreCase(categoryObj.getCategory())) {
					for (SMOBlogSubCategory subOj : categoryObj.getSubCategory()) {
						if (subOj.getName().equalsIgnoreCase(subcategory)) {
							listOfAllFAQs = faQsManager.getFAQBySubCategory(subOj
									.getId());
						}
					}
				}
			}	
		}
		
		ModelAndView m = new ModelAndView();
		m.addObject("listOfAllFAQs", listOfAllFAQs);
		m.addObject("categories", categories);
		m.setViewName("faqPage");
		return m;
	}

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public ModelAndView faqPage() {
		List<SMOBlogCategory> categories = blogCategoryManager
				.getAllContentCategory();
		ModelAndView m = new ModelAndView();
		m.addObject("categories", categories);
		m.setViewName("faqHome");
		return m;
	}

}
