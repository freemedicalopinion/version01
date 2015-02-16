package com.smo.service.city;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOCity;
import com.smo.repository.CityCustomQuery;
import com.smo.repository.CityRepository;

@Service
public class CityServiceImpl implements CityService {

	@Autowired
	CityRepository cityRepository;
	@Autowired
	CityCustomQuery cityCustomQuery;

	@Override
	public void addCity(SMOCity city) {
		cityRepository.save(city);

	}

	@Override
	public List<SMOCity> getAllCities() {
		return cityRepository.findAll();
	}

	@Override
	public void deleteCity(SMOCity city) {
		cityRepository.delete(city);

	}

	@Override
	public SMOCity findCity(String id) {
		return cityRepository.findOne(id);
		
	}

	@Override
	public List<SMOCity> searchCityByName(String keyword) {
		return cityCustomQuery.searchByText(keyword);
	}

	@Override
	public List<SMOCity> searchCityByRegex(String keyword) {
		return cityCustomQuery.searchByRegex(keyword);
	}

}
