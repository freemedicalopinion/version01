package com.smo.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

import com.smo.model.SMOUser;

public class LogoutSuccesshandler extends SimpleUrlLogoutSuccessHandler {

	@Override
	public void onLogoutSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		if (((SMOUser) authentication.getPrincipal()).isLoginViaInternalUser()) {
			SecurityContextHolder.getContext().setAuthentication(
					(Authentication) ((SMOUser) authentication.getPrincipal())
							.getOldOAuth());
			response.sendRedirect("secure/internalUserLogin");
		} else {
			super.onLogoutSuccess(request, response, authentication);
		}
	}
}
