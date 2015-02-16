package com.smo.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.smo.constant.AppConstants;
import com.smo.constant.RoleEnum;
import com.smo.utility.SMOException;
import com.smo.utility.UserUtility;

public class Interceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = Logger.getLogger(Interceptor.class);

	// before the actual handler will be executed
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		long startTime = System.currentTimeMillis();

		StringBuffer requestUrl = request.getRequestURL();
		if (requestUrl.indexOf("/secure/") > 0) {
			String requestedResource = requestUrl.substring(
					requestUrl.lastIndexOf("/") + 1, requestUrl.length());
			List<String> roles = UserUtility.getLoggedInUserRoleList();
			if (roles.contains(AppConstants.ROLE_ADMIN)) {
				if (!RoleEnum.AdminUserUrls.getAdminUserUrlsList().contains(
						requestedResource)) {
					throw new SMOException("request for requestUrl denied "
							+ requestUrl);
				}
			} else if (roles.contains(AppConstants.ROLE_DOCTOR)) {
				if (!RoleEnum.DoctorUserUrls.getDoctorUserUrlsList().contains(
						requestedResource)) {
					throw new SMOException("request for requestUrl denied "
							+ requestUrl);
				}
			} else if (roles.contains(AppConstants.ROLE_HOSPITAL)) {
				if (!RoleEnum.HospitalUserUrls.getHospitalUserUrlsList()
						.contains(requestedResource)) {
					throw new SMOException("request for requestUrl denied "
							+ requestUrl);
				}
			} else if (roles.contains(AppConstants.ROLE_PATIENT)) {
				if (!RoleEnum.PatientUserUrls.getPatientUserUrlsList()
						.contains(requestedResource)) {
					throw new SMOException("request for requestUrl denied "
							+ requestUrl);
				}
			}
		}

		request.setAttribute("startTime", startTime);

		return true;
	}

	// after the handler is executed
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		long startTime = (Long) request.getAttribute("startTime");

		long endTime = System.currentTimeMillis();

		long executeTime = endTime - startTime;

	}

}
