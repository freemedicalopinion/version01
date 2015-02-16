package com.smo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.smo.manager.DoctorManager;
import com.smo.model.SMOFeed;
import com.smo.utility.SMOException;
import com.smo.utility.UserUtility;

import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.FacebookFactory;
import facebook4j.Post;
import facebook4j.Reading;
import facebook4j.ResponseList;
import facebook4j.auth.AccessToken;
import facebook4j.auth.OAuthAuthorization;
import facebook4j.auth.OAuthSupport;
import facebook4j.conf.Configuration;
import facebook4j.conf.ConfigurationBuilder;

@Controller
public class FacebookFeed {
	@Autowired
	DoctorManager doctorManager;
	
	@RequestMapping(value = "/facebook", method = RequestMethod.GET)
	public @ResponseBody
	String getFacebookFeed()
			throws SMOException, FacebookException {
		String userName = doctorManager.getDoctorByUsername(
				UserUtility.getLoggedInUserUserName()).getSocial() != null ? doctorManager
				.getDoctorByUsername(UserUtility.getLoggedInUserUserName())
				.getSocial().getFacebook()
				: null;
		if (userName == null) {
			return null;
		}
		Configuration configuration = createConfiguration();
		FacebookFactory facebookFactory = new FacebookFactory(configuration);
		Facebook facebookClient = facebookFactory.getInstance();
		AccessToken accessToken = null;
		try {
			OAuthSupport oAuthSupport = new OAuthAuthorization(configuration);
			accessToken = oAuthSupport.getOAuthAppAccessToken();

		} catch (FacebookException e) {
			System.err.println("Error while creating access token "
					+ e.getLocalizedMessage());
		}
		facebookClient.setOAuthAccessToken(accessToken);
		// results in an error says {An active access token must be used to
		// query information about the current user}
		// Set limit to 25 feeds.

		ResponseList<Post> feeds = facebookClient.getFeed(userName,
				new Reading().limit(25));
		List<SMOFeed> feed = new ArrayList<SMOFeed>();

		if (feeds != null) {
			for (Post post : feeds) {
				SMOFeed f = new SMOFeed();
				f.setFeed(post.getMessage());
				f.setCreatedDate(post.getCreatedTime());
				if (post.getPicture() != null) {
					f.setMediaURL(post.getPicture().toString());
				}
				feed.add(f);
			}
		}
		Gson gson = new Gson();
		String response = gson.toJson(feed);
		return response;

	}

	private Configuration createConfiguration() {
		ConfigurationBuilder confBuilder = new ConfigurationBuilder();
		confBuilder.setDebugEnabled(true);
		confBuilder.setOAuthAppId("1560667607497102");
		confBuilder.setOAuthAppSecret("1b464b1cf4341f18989e3946b9437faf");
		confBuilder.setUseSSL(true);
		confBuilder.setJSONStoreEnabled(true);
		Configuration configuration = confBuilder.build();
		return configuration;
	}

}
