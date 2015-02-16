package com.smo.service.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOSearch;
import com.smo.repository.SearchRepository;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchRepository searchRepository;

	@Override
	public SMOSearch getSeachByQuery(String query) {
		List<SMOSearch> searchList = searchRepository.findByQuery(query);
		if (searchList != null && searchList.size() > 0) {
			return searchList.get(0);
		}
		return null;
	}

	@Override
	public void saveSearch(SMOSearch search) {
		searchRepository.save(search);

	}

}
