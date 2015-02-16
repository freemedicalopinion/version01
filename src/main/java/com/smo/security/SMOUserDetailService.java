package com.smo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.smo.manager.RegistrationManager;
import com.smo.model.SMOUser;

@Component
public class SMOUserDetailService implements UserDetailsService {

	@Autowired
	RegistrationManager userManager;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		if (username == null || username == "") {
			return null;
		}
		SMOUser user = userManager.getUser(username);
		if (user == null) {
			return null;
		}
		return user;
	}

}
