package com.smo.manager;

import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOTmpToken;
import com.smo.model.SMOUser;
import com.smo.service.user.UserService;
import com.smo.utility.CodeGenerator;
import com.smo.utility.Encryption;
import com.smo.utility.MailApi;

@Component
public class RegistrationManager {
	@Autowired
	UserService userService;
	@Autowired
	TmpTokenManager tmpTokenManager;
	@Autowired
	UserManager userManager;

	public boolean addUserAfterRegistration(SMOUser user, boolean isRegistered) {
		Encryption e = new Encryption();
		SMOTmpToken userToken = new SMOTmpToken();
		user.setCreatedDate(new Date());
		String emailVerificationCode = CodeGenerator.getEmailVerificationCode();
		try {
			user.setPassword(e.encryption(user.getPassword()));
		} catch (GeneralSecurityException e1) {
			e1.printStackTrace();
		}
		
		if (userService.addUser(user)) {
			
			userToken.setUserId(user.getUsername());
			userToken.setEmailVerificationToken(emailVerificationCode);
			tmpTokenManager.addTmpTokenForUser(userToken);
			if (isRegistered) {
				String body = "Please click on following link to to verify your emailId <br><br> <a href='http://127.0.0.1:9999/smo/verifyEmail?username="
						+ user.getUsername()
						+ "&verificationcode="
						+ emailVerificationCode
						+ "'>Click here to verify email</a>";
				MailApi.sendMail(user.getUsername(), body);
			}
			return true;
		}
		return false;

	}

	public void resendEmailVerificationCode(String userId) {
		SMOTmpToken userToken = tmpTokenManager.getTmpTokenForUser(userId);
		String body = "Please click on following link to to verify your emailId <br><br> <a href='http://127.0.0.1:9999/smo/verifyEmail?username="
				+ userToken.getUserId()
				+ "&verificationcode="
				+ userToken.getEmailVerificationToken()
				+ "'>Click here to verify email</a>";
		MailApi.sendMail(userToken.getUserId(), body);
	}

	public void sendEmailForForgotPassword() {

	}

	public boolean checkUserName(String userName) {
		SMOUser user = userService.getUserByUserName(userName);
		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

	public SMOUser getUser(String userName) {
		SMOUser user = userService.getUserByUserName(userName);
		if (user == null) {
			return null;
		} else {
			return user;
		}
	}

	public boolean verifyEmail(String userName, String verificationCode) {
		SMOUser user = userService.getUserByUserName(userName);
		SMOTmpToken userToken = tmpTokenManager.getTmpTokenForUser(userName);
		if (user == null) {
			return false;
		} else if (userToken.getEmailVerificationToken().equalsIgnoreCase(
				verificationCode)) {
			user.setEmailVerified(true);
			userService.updateUser(user);
			return true;
		}
		return false;
	}

	public List<SMOUser> getAllPendingRegistration() {
		return userService.getAllPendingRegistration();
	}

}
