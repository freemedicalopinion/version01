package com.smo.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOHospitalReviewHistory;
import com.smo.service.hospitalReview.HospitalReviewService;

@Component
public class HospitalReviewManager {

	@Autowired
	HospitalReviewService hospitalReviewService;

	public void addReview(SMOHospitalReviewHistory hoHistory) {
		if (hoHistory != null) {
			hospitalReviewService.addReview(hoHistory);
		}
	}

	public List<SMOHospitalReviewHistory> getAllReviewsForHospital(String userName) {
		return hospitalReviewService.getAllReviewOfHospital(userName);

	}

}
