package com.smo.service.doctorReview;

import java.util.List;

import com.smo.model.SMODoctorReviewHistory;

public interface DoctorReviewService {

	public void addReview(SMODoctorReviewHistory doctorReview);

	public List<SMODoctorReviewHistory> getAllReviewOfDoctor(String userName);
	
	public List<SMODoctorReviewHistory> getAllReviewForListOfDoctor(List<String> userName);

}
