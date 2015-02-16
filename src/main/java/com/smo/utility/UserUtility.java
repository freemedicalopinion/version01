package com.smo.utility;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.smo.model.SMOUser;

public class UserUtility {

	public static boolean checkSingleRole(String role) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		SMOUser user = null;
		if (auth != null) {
			user = (SMOUser) auth.getPrincipal();
		}
		if (user.getRoles().contains(role)) {
			return true;
		}

		return false;

	}

	public static List<String> getLoggedInUserRoleList() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		SMOUser user = null;
		if (auth != null) {
			user = (SMOUser) auth.getPrincipal();
		}
		return user.getRoles();

	}

	public static boolean checkIfUserLoggedIn() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth != null) {
			return true;
		}
		return false;

	}

	public static String getLoggedInUserUserName() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth != null) {
			return auth.getName();
		}
		return null;

	}

	public static SMOUser getLoggedInUser() {
		if (SecurityContextHolder.getContext().getAuthentication() != null) {
			SMOUser user = (SMOUser) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
			return user;
		}
		return null;
	}

}
