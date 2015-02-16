package com.smo.manager;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOSearch;
import com.smo.service.search.SearchService;

@Component
public class SearchManager {
	@Autowired
	SearchService searchService;

	public void saveSearch(String search) {
		SMOSearch searchResult = getSearchByQuery(search);
		if (searchResult == null) {
			searchResult = new SMOSearch();

		}
		searchResult.setCount(searchResult.increseCount());
		searchResult.setLastSearched(new Date());
		searchService.saveSearch(searchResult);
	}

	public SMOSearch getSearchByQuery(String query) {
		return searchService.getSeachByQuery(query);
	}

}
