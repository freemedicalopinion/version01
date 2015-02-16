package com.smo.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.smo.constant.AppConstants;
import com.smo.manager.RegistrationManager;
import com.smo.manager.TmpTokenManager;
import com.smo.manager.UserManager;
import com.smo.model.SMOTmpToken;
import com.smo.model.SMOUser;
import com.smo.utility.CodeGenerator;
import com.smo.utility.MailApi;

@Controller
public class RegistrationController {
	@Autowired
	private RegistrationManager registrationManager;
	@Autowired
	private TmpTokenManager userTokenManager;
	@Autowired
	private UserManager userManager;

	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "msg", required = false) String msg,
			@RequestParam(value = "registrationsuccess", required = false) String registrationsuccess,
			@RequestParam(value = "registrationerror", required = false) String registrationerror) {

		ModelAndView model = new ModelAndView();
		model.addObject("user", new SMOUser());
		model.addObject("error", error);
		model.addObject("msg", msg);
		model.addObject("registrationsuccess", registrationsuccess);
		model.addObject("registrationerror", registrationerror);
		model.setViewName("login");
		return model;

	}

	@RequestMapping(value = "/registerPatient", method = RequestMethod.POST)
	public String registerPatient(@ModelAttribute("user") SMOUser user,
			BindingResult result) {
		if (user.getUsername() != null && user.getUsername() != ""
				&& user.getPassword() != "" && user.getPassword() != "") {

			user.addRole(AppConstants.ROLE_PATIENT);
			user.setRegisterationApproved(true);

			if (registrationManager.addUserAfterRegistration(user, true)) {
				return "redirect:/login?registrationsuccess=Registration Successfully done . please verify your email id";
			} else {
				return "redirect:/login?registrationerror=email is already exist.";
			}
		} else {
			return "redirect:/login?registrationerror=Invalid Input";
		}

	}

	@RequestMapping(value = "/requestRegistration", method = RequestMethod.POST)
	public String addRegistrationRequest(@ModelAttribute("user") SMOUser user,
			BindingResult result) {

		user.setAccountNonLocked(false);
		user.setPassword(CodeGenerator.getRandomPassword());
		user.setRegisterationApproved(false);

		registrationManager.addUserAfterRegistration(user, false);
		return "redirect:/login";

	}

	@RequestMapping(value = "/verifyEmail", method = RequestMethod.GET)
	public String verifyEmail(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "verificationcode", required = false) String verificationcode) {

		if (registrationManager.verifyEmail(username, verificationcode)) {
			return "redirect:/login?msg=Email Verified Successfully . Plean Login";
		} else {
			return "redirect:/login?error=Verification Code is Wrong .Please contact customer care";
		}
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String forgotPassword() {

		return "forgotPassword";

	}

	@RequestMapping(value = "/forgotPasswordLink", method = RequestMethod.POST)
	public String forgotPasswordLink(@RequestParam("email") String email) {

		SMOTmpToken userToken = userTokenManager.getTmpTokenForUser(email);
		String oneTimeChangePasswordCode = CodeGenerator
				.getForgotPasswordCode();
		userToken.setForgotPasswordToken(oneTimeChangePasswordCode);
		userToken.setForgotPasswordTokenDate(new Date());
		String tmpPassord = CodeGenerator.getTmpCodeForForgotPassword();
		userToken.setTmpCodeForForgot(tmpPassord);
		userTokenManager.addTmpTokenForUser(userToken);
		String mailBody = "Tmp Password     "
				+ tmpPassord
				+ "<br><br> Plase click on link to change password <br><br>"
				+ "<a href='http://127.0.0.1:9999/smo/changePasswordForm?OneTimeToken="
				+ oneTimeChangePasswordCode + "&userName="
				+ userToken.getUserId() + "'>" + "Change Password</a>";
		MailApi.sendMail(userToken.getUserId(), mailBody);

		return "redirect:/login";

	}

	@RequestMapping(value = "/checkUniqueUser", method = RequestMethod.GET)
	@ResponseBody
	public boolean checkUniqueUser(@Param("user") String user) {

		return registrationManager.checkUserName(user);

	}

	@RequestMapping(value = "/secure/welcome", method = RequestMethod.GET)
	public String welcome() {
		return "secure/home";

	}

	@RequestMapping(value = "/resendEmailVerificationPage", method = RequestMethod.GET)
	public String resendEmailVerificationPageRequest() {

		return "resendEmailVerification";

	}

	@RequestMapping(value = "/resendEmailVerification", method = RequestMethod.POST)
	public String resendEmailVerification(@RequestParam("email") String email) {
		registrationManager.resendEmailVerificationCode(email);

		return "redirect:/login?msg=Email verification code sent Successfully . Plean Verify";

	}

}
