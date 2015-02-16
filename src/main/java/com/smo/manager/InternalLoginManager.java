package com.smo.manager;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import com.smo.model.SMOUser;
import com.smo.security.SMOUserDetailService;

@Component
public class InternalLoginManager {
	@Autowired
	private SMOUserDetailService userDetailsService;

	public void login(HttpServletRequest request, String userName) {

		UserDetails uds = userDetailsService.loadUserByUsername(userName);
		if (uds != null) {
			Collection<? extends GrantedAuthority> authorities = uds
					.getAuthorities();
			SMOUser user = (SMOUser) uds;
			user.setLoginViaInternalUser(true);
			user.setOldOAuth(SecurityContextHolder.getContext()
					.getAuthentication());

			Authentication authentication = new UsernamePasswordAuthenticationToken(
					user, "", authorities);
			SecurityContextHolder.getContext()
					.setAuthentication(authentication);
		}

	}

	public void logoutFromInternalUser() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		SMOUser user = null;
		if (auth != null) {
			user = (SMOUser) auth.getPrincipal();
		}
		if (user != null && user.isLoginViaInternalUser()) {
			SecurityContextHolder.getContext().setAuthentication(
					(Authentication) user.getOldOAuth());
		}

	}

}
