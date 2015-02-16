package com.smo.controller;

import java.security.GeneralSecurityException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smo.constant.AppConstants;
import com.smo.manager.RegistrationManager;
import com.smo.manager.TmpTokenManager;
import com.smo.manager.UserManager;
import com.smo.model.SMOTmpToken;
import com.smo.model.SMOUser;
import com.smo.utility.CodeGenerator;
import com.smo.utility.UserUtility;
import com.smo.utility.Utility;

@Controller
public class CommonChangePasswordController {
	@Autowired
	RegistrationManager registrationmanager;
	@Autowired
	UserManager userManager;
	@Autowired
	private TmpTokenManager userTokenManager;

	@RequestMapping(value = "/secure/changePassword", method = RequestMethod.POST)
	public String changePassword(@Param("password") String password,
			@Param("newPassword") String newPassword,
			@Param("repeatNewPassword") String repeatNewPassword,
			HttpServletRequest request) throws GeneralSecurityException {
		ModelAndView m = new ModelAndView();
		String user = UserUtility.getLoggedInUserUserName();

		SMOUser dbUser = registrationmanager.getUser(user);
		if (Utility.matchPassword(dbUser.getPassword(), password)) {
			if (newPassword.equals(repeatNewPassword)) {
				userManager.changePassword(user, newPassword);
				m.addObject("success", "Password Changed");
			}
		}
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}
	
	@RequestMapping(value = "/changePasswordForm", method = RequestMethod.GET)
	public ModelAndView changePasswordAfterForgot(
			@RequestParam("userName") String userName,
			@RequestParam("OneTimeToken") String OneTimeToken) {
		String changePasswordToken = null;
		SMOTmpToken userToken = userTokenManager.getTmpTokenForUser(userName);
		ModelAndView m = new ModelAndView();
		if (userToken != null) {
			if (userToken.getForgotPasswordToken().equals(OneTimeToken)) {

				long tokenCreatedTime = userToken.getForgotPasswordTokenDate()
						.getTime();
				long currentTime = new Date().getTime();
				if (currentTime - tokenCreatedTime > AppConstants.LIFE__TIME_FORGOT_PASSWORD_ONE_TIME_TOKEN_IN_MILLI_SEC) {
					// one time forgot password token expired
					return new ModelAndView(
							"redirect:/login?error=Token expired");
				} else {
					changePasswordToken = CodeGenerator
							.getTmpCodeForChangePassword();
					userToken.setChangePasswordToken(changePasswordToken);
					userToken.setChangePasswordTokenDate(new Date());
					m.addObject("changepasswordtoken", changePasswordToken);
					m.addObject("userId", userToken.getUserId());

				}
			} else {
				// Forgot password not matched
				return new ModelAndView("redirect:/login?error=Invalid token");
			}
		} else {
			// No record found for user name
			return new ModelAndView("redirect:/login?error=Email not found");
		}
		m.setViewName("changePassword");
		return m;

	}
	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
	public String changepassword(
			@RequestParam("newPassword") String newPassword,
			@RequestParam("changepasswordtoken") String changepasswordtoken,
			@RequestParam("tmpPassword") String tmpPassword,
			@RequestParam("userId") String userId)
			throws GeneralSecurityException {
		SMOTmpToken userToken = userTokenManager.getTmpTokenForUser(userId);
		if (userToken == null) {
			// user not found
		} else {
			long tokenCreatedTime = userToken.getChangePasswordTokenDate()
					.getTime();
			long currentTime = new Date().getTime();
			if (currentTime - tokenCreatedTime > AppConstants.LIFE_TIME_CHANGE_PASSWORD_ONE_TIME_TOKEN_IN_MILLI_SEC) {
				// token expired
			} else {
				if (userToken.getChangePasswordToken().equals(
						changepasswordtoken)) {
					if (userToken.getTmpCodeForForgot().equalsIgnoreCase(
							tmpPassword)) {
						// change password
						userManager.changePassword(userToken.getUserId(),
								newPassword);
						return "redirect:/login?msg=Password changed successfully. Plean Login";
					} else {
						// Temp Code incorrect
					}
				} else {
					// token tempered
				}
			}
		}
		return userId;

	}


}
