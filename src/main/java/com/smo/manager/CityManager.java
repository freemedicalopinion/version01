package com.smo.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import com.smo.model.SMOCity;
import com.smo.service.city.CityService;

@Component
public class CityManager {

	@Autowired
	CityService cityService;

	@CacheEvict(value = "cities", allEntries = true)
	public void addCity(SMOCity city) {
		if (city.getCity() != null && !city.getCity().equalsIgnoreCase("")) {
			cityService.addCity(city);
		}

	}

	@Cacheable(value = "cities")
	public List<SMOCity> getAllCities() {
		System.out.println("getting all city from database");
		return cityService.getAllCities();
	}

	@CacheEvict(value = "cities", allEntries = true)
	public void deleteCity(String id) {
		SMOCity city = cityService.findCity(id);
		if (city != null) {
			cityService.deleteCity(city);
		}

	}

	public List<SMOCity> searchCityByName(String keyword) {
		return cityService.searchCityByName(keyword);
	}

	public List<SMOCity> searchCityByRegex(String keyword) {
		return cityService.searchCityByRegex(keyword);
	}

}
