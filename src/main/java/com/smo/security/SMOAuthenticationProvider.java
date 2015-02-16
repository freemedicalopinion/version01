package com.smo.security;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import com.smo.manager.TmpTokenManager;
import com.smo.model.SMOUser;
import com.smo.utility.Utility;

@Component
public class SMOAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	private SMOUserDetailService userDetailsService;
	@Autowired
	private TmpTokenManager userTokenManager;

	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		String username = null;
		String password = null;
		if (authentication.getName() != null && authentication.getName() != "") {
			username = authentication.getName();
		} else {
			throw new BadCredentialsException("Wrong password.");
		}

		if (authentication.getCredentials() != null
				&& authentication.getCredentials() != "") {
			password = (String) authentication.getCredentials();
		} else {
			throw new BadCredentialsException("Wrong password.");
		}

		UserDetails uds = userDetailsService.loadUserByUsername(username);

		if (uds != null) {
			SMOUser uso = (SMOUser) uds;

			if (!Utility.matchPassword(uso.getPassword(), password)) {
				throw new BadCredentialsException("Wrong password.");
			}
			if (!uso.isEmailVerified()) {
				throw new LockedException("Email is not verified");
			} else if (!uso.isRegisterationApproved()) {
				throw new LockedException("Registration Not Approved");
			} else if (!uso.isCredentialsNonExpired()) {
				throw new CredentialsExpiredException("Credential Expired");
			} else if (!uso.isAccountNonLocked()) {
				throw new AccountExpiredException("Account is locked");
			}
		} else {
			throw new BadCredentialsException("User is Not Registered");
		}

		Collection<? extends GrantedAuthority> authorities = uds
				.getAuthorities();

		return new UsernamePasswordAuthenticationToken(uds, password,
				authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return (UsernamePasswordAuthenticationToken.class
				.isAssignableFrom(authentication));
	}

	/**
	 * @return the userDetailsService
	 */
	public SMOUserDetailService getUserDetailsService() {
		return userDetailsService;
	}

	/**
	 * @param userDetailsService
	 *            the userDetailsService to set
	 */
	public void setUserDetailsService(SMOUserDetailService userDetailsService) {
		this.userDetailsService = userDetailsService;
	}

}
