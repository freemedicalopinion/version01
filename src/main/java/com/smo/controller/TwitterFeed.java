package com.smo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import twitter4j.Paging;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

import com.google.gson.Gson;
import com.smo.manager.DoctorManager;
import com.smo.model.SMOFeed;
import com.smo.utility.SMOException;
import com.smo.utility.UserUtility;

@Controller
public class TwitterFeed {

	@Autowired
	DoctorManager doctorManager;

	@RequestMapping(value = "/twiter", method = RequestMethod.GET)
	public @ResponseBody
	String getTwitterFeed() throws SMOException {

		String userName = doctorManager.getDoctorByUsername(
				UserUtility.getLoggedInUserUserName()).getSocial() != null ? doctorManager
				.getDoctorByUsername(UserUtility.getLoggedInUserUserName())
				.getSocial().getTwitter()
				: null;
		if (userName == null) {
			return null;
		}
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setOAuthConsumerKey("NTS17KndsyrcrVrLKSt2sJYch");
		cb.setOAuthConsumerSecret("ZJWWwCmsVt32jcCE82kVAJapEvDhqywNYIEVgxAaCTpX9xaH23");
		cb.setOAuthAccessToken("2206841178-sRteZE397zTjCPwxXgvmTzA72BrmfO4Sw33XjIa");
		cb.setOAuthAccessTokenSecret("qradgNZvrhgqG8gldxZ8VqW1ASVVcWBi6WnC4XkdpzSEE");
		@SuppressWarnings("rawtypes")
		List statuses = null;

		Twitter twitter = new TwitterFactory(cb.build()).getInstance();
		List<SMOFeed> twitterFeed = new ArrayList<SMOFeed>();
		Paging paging = new Paging(1, 10);
		try {
			statuses = twitter.getUserTimeline(userName, paging);
		} catch (TwitterException e) {
		}
		if (statuses != null) {
			for (int i = 0; i < statuses.size(); i++) {
				SMOFeed tweet = new SMOFeed();
				Status status = (Status) statuses.get(i);
				tweet.setCreatedDate(status.getCreatedAt());
				tweet.setFavoriteCount(status.getFavoriteCount());
				tweet.setFeed(status.getText());
				tweet.setUser(status.getUser().getName());
				if (status.getMediaEntities().length > 0) {
					tweet.setMediaURL(status.getMediaEntities()[0]
							.getMediaURL());
					tweet.setUrl(status.getMediaEntities()[0].getDisplayURL());
				}
				tweet.setRetweetCount(status.getRetweetCount());

				twitterFeed.add(tweet);
			}
		} else {
			throw new SMOException();
		}
		Gson gson = new Gson();
		String response = gson.toJson(twitterFeed);
		return response;

	}

}
