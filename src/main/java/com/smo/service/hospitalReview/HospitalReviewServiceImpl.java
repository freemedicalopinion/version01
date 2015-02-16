package com.smo.service.hospitalReview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMODoctorReviewHistory;
import com.smo.model.SMOHospitalReviewHistory;
import com.smo.repository.DoctorReviewRepository;
import com.smo.repository.HospitalReviewRepository;

@Service
public class HospitalReviewServiceImpl implements HospitalReviewService {

	@Autowired
	HospitalReviewRepository repository;

	@Override
	public void addReview(SMOHospitalReviewHistory hospitalReview) {
		repository.save(hospitalReview);
	}

	@Override
	public List<SMOHospitalReviewHistory> getAllReviewOfHospital(String userName) {

		return repository.findByUserName(userName);
	}

	@Override
	public List<SMOHospitalReviewHistory> getAllReviewForListOfhospital(
			List<String> userName) {
		// TODO Auto-generated method stub
		return null;
	}



}
