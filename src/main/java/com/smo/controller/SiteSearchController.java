package com.smo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.smo.manager.BlogCategoryManager;
import com.smo.manager.BlogManager;
import com.smo.manager.SearchManager;
import com.smo.model.SMOBlogCategory;

@Controller
public class SiteSearchController {

	@Autowired
	BlogCategoryManager cateogyManager;
	@Autowired
	private BlogManager blogManager;
	@Autowired
	SearchManager searchManager;

	@RequestMapping(value = { "{sa}/searchAutoComplete", "/searchAutoComplete" })
	public @ResponseBody
	String getSearchKeyWords() {
		List<String> words = new ArrayList<String>();
		List<SMOBlogCategory> allCategory = cateogyManager
				.getAllContentCategory();
		for (SMOBlogCategory cate : allCategory) {
			words.add(cate.getCategory());
			if (cate.getSubCategory() != null) {
				/*for (String subCategory : cate.getSubCategory()) {
					words.add(subCategory);
				}*/
			}
		}
		words.add("ab");
		words.add("abb");
		words.add("abbb");
		words.add("abbbb");
		words.add("abbbbbb");
		words.add("abbbbbbbbb1");
		words.add("abbbbbbbbb2");
		words.add("abbbbbbbbb3");
		words.add("abbbbbbbbb4");
		words.add("abbbbbbbbb5");
		words.add("abbbbbbbbb6");
		words.add("abbbbbbbbb7");
		
		words.add("abbbbbbbbb8");
		words.add("abbbbbbbbb9");
		words.add("abbbbbbbbb0");
		words.add("abbbbbbbbb11");
		
		words.add("abbbbbbbbb12");
		words.add("abbbbbbbbb13");
		words.add("abbbbbbbbb14");
		
		
		Gson g = new Gson();
		return g.toJson(words);

	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String homePage(@RequestParam("keyWord") String keyWord) {
		
		searchManager.saveSearch(keyWord);
		List<SMOBlogCategory> allCategory = cateogyManager
				.getAllContentCategory();
		for (SMOBlogCategory cate : allCategory) {
			if (keyWord.equalsIgnoreCase(cate.getCategory())) {
				return "redirect:blogsCategoryHome/" + cate.getCategory();
			}
			if (cate.getSubCategory() != null) {
				/*for (String subCategory : cate.getSubCategory()) {
					if (keyWord.equalsIgnoreCase(subCategory)) {

					}
				}*/
			}
		}
	//	List<SMOBlog> data = blogManager.getBlogsByKeyWords(keyWord);
		return null;

	}
	
	
}
