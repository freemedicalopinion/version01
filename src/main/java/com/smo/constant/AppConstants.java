package com.smo.constant;

public interface AppConstants {

	/**
	 * External location to save all files
	 * */

	String FILE_STORE_LOCATION = "C:\\test\\test\\smo\\images\\";

	/**
	 * Role
	 * */

	String ROLE_ADMIN = "Admin";
	String ROLE_HOSPITAL = "hospital";
	String ROLE_DOCTOR = "doctor";
	String ROLE_CORPORATE = "corporate";
	String ROLE_PATIENT = "patient";

	/**
	 * Crypto
	 * */
	String CRYPTO_ALOGORITHM = "AES";
	String CRYPTO_KEY = "ThisIsASecretKey";

	String CONTENT_TYPE_NEWS = "News";
	String CONTENT_TYPE_BLOG = "Blog";

	String DATE_FORMAT_SAVE = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";
	String IMAGE_TYPE_BIG = "big";
	String IMAGE_TYPE_MEDIUM = "midium";
	String IMAGE_TYPE_THUMB = "thumb";
	String IMAGE_TYPE_PROFILE = "profile";

	int contentSizeByCategoryInHomePage = 6;
	int contentLatestInHomePage = 10;
	int relatedBlogCount = 12;
	int commentCountForBlogHomePage = 12;

	/**
	 * Life Time Of Token
	 * */
	int LIFE__TIME_FORGOT_PASSWORD_ONE_TIME_TOKEN_IN_MILLI_SEC = 600000; // 10Mins
	int LIFE_TIME_CHANGE_PASSWORD_ONE_TIME_TOKEN_IN_MILLI_SEC = 600000;// 10Mins

	/**
	 * Urls
	 * */
	String URL_LOGIN="";
	String URL_REGISTRATION="";

}
