package com.smo.service.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.stereotype.Service;

import com.mongodb.DBObject;
import com.smo.model.SMOHospital;
import com.smo.repository.BlogCustomQuery;
import com.smo.repository.HospitalCustomQuey;
import com.smo.repository.HospitalRepository;

@Service
public class HospitalServiceImpl implements HospitalService {
	@Autowired
	HospitalRepository hospitalRepo;

	@Autowired
	private BlogCustomQuery blogCustomQuery;
	@Autowired
	HospitalCustomQuey customQuey;

	@Override
	public void addHospital(SMOHospital hospital) {
		hospitalRepo.save(hospital);
	}

	@Override
	public SMOHospital getHospitalByName(String hospital) {
		List<SMOHospital> hospitaldata = hospitalRepo.findByUsername(hospital);
		if (hospitaldata != null && hospitaldata.size() > 0) {
			return hospitaldata.get(0);
		}
		return null;
	}

	@Override
	public SMOHospital getHospitalById(String id) {
		return hospitalRepo.findOne(id);
	}

	@Override
	public List<SMOHospital> findAllHospiital() {
		// TODO Auto-generated method stub
		return hospitalRepo.findAll();
	}

	@Override
	public List<SMOHospital> getLatestHospitals(int limit) {
		return blogCustomQuery.getLatestHospitals(limit);
	}

	@Override
	public int getTotalCount() {
		return hospitalRepo.findAll().size();
	}

	@Override
	public List<SMOHospital> getHospitalByTextSearch(int count, String... keyWords) {

		return customQuey.searchHospitalTextSearch(count,keyWords);
	}

	@Override
	public List<SMOHospital> getHospitalByRegexSearch(String keyWord) {
		// TODO Auto-generated method stub
		return customQuey.searchHospitalRegexSearch(keyWord);
	}

	@Override
	public List<SMOHospital> getHospitals(List<String> hospitals) {
		return customQuey.getHospitals(hospitals);

	}
	@Override
	public AggregationResults<DBObject> getAverageRating(String... userIds) {
		// TODO Auto-generated method stub
		return customQuey.getAverageRating(userIds);
	}
}
