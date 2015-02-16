package com.smo.service.hospitalReview;

import java.util.List;

import com.smo.model.SMOHospitalReviewHistory;

public interface HospitalReviewService {

	public void addReview(SMOHospitalReviewHistory hospitalReviewHistory);

	public List<SMOHospitalReviewHistory> getAllReviewOfHospital(String userName);
	
	public List<SMOHospitalReviewHistory> getAllReviewForListOfhospital(List<String> userName);

}
