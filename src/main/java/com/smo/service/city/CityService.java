package com.smo.service.city;

import java.util.List;

import com.smo.model.SMOCity;

public interface CityService {

	public void addCity(SMOCity city);

	public List<SMOCity> getAllCities();

	public void deleteCity(SMOCity city);

	public SMOCity findCity(String id);

	public List<SMOCity> searchCityByName(String keyword);
	public List<SMOCity> searchCityByRegex(String keyword);

}
