package com.smo.service.doctor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.stereotype.Service;

import com.mongodb.DBObject;
import com.smo.model.SMODoctor;
import com.smo.repository.BlogCustomQuery;
import com.smo.repository.DoctorCustomQuey;
import com.smo.repository.DoctorRepository;

@Service
public class DoctorServiceImpl implements DoctorService {
	@Autowired
	DoctorRepository docRepo;
	@Autowired
	BlogCustomQuery blogCustomQuery;
	@Autowired
	DoctorCustomQuey doctorCustomQuey;

	@Override
	public void addDoctor(SMODoctor doc) {
		docRepo.save(doc);

	}

	@Override
	public SMODoctor getDoctorByUsername(String username) {
		List<SMODoctor> doc = docRepo.findByUsername(username);
		if (doc != null && doc.size() > 0) {
			return doc.get(0);
		}
		return null;
	}

	@Override
	public SMODoctor getDoctorByProfileName(String profileName) {
		List<SMODoctor> doc = docRepo.findByProfileName(profileName);
		if (doc != null && doc.size() > 0) {
			return doc.get(0);
		}
		return null;
	}

	@Override
	public SMODoctor getDoctorById(String id) {
		// TODO Auto-generated method stub
		return docRepo.findOne(id);
	}

	@Override
	public List<SMODoctor> getLatestDoctorsByLimit(int limit) {
		List<SMODoctor> latestDoctorsByLimit = blogCustomQuery
				.getLatestDoctors(limit);
		return latestDoctorsByLimit;
	}

	@Override
	public int getTotalCount() {
		List<SMODoctor> allSMODoctors = docRepo.findAll();
		return allSMODoctors.size();
	}

	@Override
	public List<SMODoctor> searchDoctorTextSearch(int limit, String... keyWords) {

		return doctorCustomQuey.searchDoctorTextSearch(limit, keyWords);
	}

	@Override
	public List<SMODoctor> searchDoctorRegexSearch(String keyWord) {
		// TODO Auto-generated method stub
		return doctorCustomQuey.searchDoctorRegexSearch(keyWord);
	}

	@Override
	public AggregationResults<DBObject> getAverageRating(String... userIds) {
		// TODO Auto-generated method stub
		return doctorCustomQuey.getAverageRating(userIds);
	}

}
