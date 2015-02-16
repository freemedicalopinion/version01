package com.smo.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMODoctorReviewHistory;
import com.smo.service.doctorReview.DoctorReviewService;

@Component
public class DoctorReviewManager {

	@Autowired
	DoctorReviewService doctorReviewService;

	public void addReview(SMODoctorReviewHistory doctorReview) {
		if (doctorReview != null) {
			doctorReviewService.addReview(doctorReview);
		}
	}

	public List<SMODoctorReviewHistory> getAllReviewsForDoctor(String userName) {
		return doctorReviewService.getAllReviewOfDoctor(userName);

	}

}
