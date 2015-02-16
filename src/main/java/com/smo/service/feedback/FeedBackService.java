package com.smo.service.feedback;

import java.util.List;

import com.smo.model.SMOFeedBack;

public interface FeedBackService {
	public void addFeedBack(SMOFeedBack smoFeedBack);
	public List<SMOFeedBack> getFeedBackByEmail(String email);
	public SMOFeedBack getFeedBackById(String id);
	public List<SMOFeedBack> getAllFeedBacks();
	
}
