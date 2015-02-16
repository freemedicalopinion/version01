package com.smo.service.feedback;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOFeedBack;
import com.smo.repository.FeedBackRepository;
@Service
public class FeedBackServiceImpl implements FeedBackService {

	@Autowired
	FeedBackRepository feedBackRepository;
	@Override
	public void addFeedBack(SMOFeedBack smoFeedBack) {
		feedBackRepository.save(smoFeedBack);
		
	}

	@Override
	public List<SMOFeedBack> getFeedBackByEmail(String email) {
		return feedBackRepository.findByEmail(email);
	}

	@Override
	public SMOFeedBack getFeedBackById(String id) {
		return feedBackRepository.findById(id);
	}

	@Override
	public List<SMOFeedBack> getAllFeedBacks() {
		return feedBackRepository.findAll();
	}

}
