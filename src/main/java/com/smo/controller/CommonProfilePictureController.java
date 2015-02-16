package com.smo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smo.constant.AppConstants;
import com.smo.manager.UserManager;
import com.smo.model.ContentImages;
import com.smo.utility.UserUtility;
import com.smo.utility.Utility;

@Controller
public class CommonProfilePictureController {

	@Autowired
	UserManager userManager;

	@RequestMapping(value = "/secure/manageProfilePicture", method = RequestMethod.POST)
	public String uploadProfilePicture(
			@ModelAttribute("imageModel") ContentImages contentImages,
			BindingResult result, HttpServletRequest request)
			throws IOException {
		String logggedInUser = UserUtility.getLoggedInUserUserName();
		String profileImage = Utility.saveFile(contentImages.getBigImage(),
				logggedInUser, AppConstants.IMAGE_TYPE_PROFILE);
		userManager.updateProfilePicture(profileImage);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

}
