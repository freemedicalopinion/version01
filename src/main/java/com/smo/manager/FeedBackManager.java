package com.smo.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOFeedBack;
import com.smo.service.feedback.FeedBackService;

@Component
public class FeedBackManager {
	@Autowired
	FeedBackService feedBackService;
	public void addFeedBack(SMOFeedBack smoFeedBack){
		feedBackService.addFeedBack(smoFeedBack);
	}
	
	public SMOFeedBack getFeedBackById(String id){
		return feedBackService.getFeedBackById(id);
	}
	
	public List<SMOFeedBack> getFeedBackByEmail(String email){
		return feedBackService.getFeedBackByEmail(email);
	}
	
	public List<SMOFeedBack> getAllFeedBacks(){
		return feedBackService.getAllFeedBacks();
	}
}
