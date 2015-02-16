package com.smo.repository;

import java.util.List;

import com.smo.model.SMOCity;

public interface CityCustomQuery {
	public List<SMOCity> searchByText(String keyWord);

	public List<SMOCity> searchByRegex(String keyWord);

}
