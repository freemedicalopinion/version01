package com.smo.service.doctorReview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMODoctorReviewHistory;
import com.smo.repository.DoctorReviewRepository;

@Service
public class DoctorReviewServiceImpl implements DoctorReviewService {

	@Autowired
	DoctorReviewRepository doctorReviewRepository;

	@Override
	public void addReview(SMODoctorReviewHistory doctorReview) {
		doctorReviewRepository.save(doctorReview);
	}

	@Override
	public List<SMODoctorReviewHistory> getAllReviewOfDoctor(String userName) {

		return doctorReviewRepository.findByUserName(userName);
	}

	@Override
	public List<SMODoctorReviewHistory> getAllReviewForListOfDoctor(
			List<String> userName) {
		
		return null;
	}

}
