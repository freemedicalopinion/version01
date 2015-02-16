package com.smo.service.search;

import com.smo.model.SMOSearch;

public interface SearchService {

	public SMOSearch getSeachByQuery(String query);

	public void saveSearch(SMOSearch search);

}
