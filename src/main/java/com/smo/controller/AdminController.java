package com.smo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.google.gson.Gson;
import com.smo.constant.AppConstants;
import com.smo.manager.CityManager;
import com.smo.manager.ConditionManager;
import com.smo.manager.ProceduresManager;
import com.smo.manager.RegistrationManager;
import com.smo.manager.SpecilityManager;
import com.smo.manager.UserManager;
import com.smo.model.SMOCity;
import com.smo.model.SMOCondition;
import com.smo.model.SMOProcedure;
import com.smo.model.SMOSpecility;
import com.smo.model.SMOUser;

@Controller
public class AdminController {
	@Autowired
	SpecilityManager specilityManager;
	@Autowired
	RegistrationManager registrationManager;
	@Autowired
	UserManager userManager;
	@Autowired
	CityManager cityManager;
	@Autowired
	ProceduresManager proceduresManager;
	@Autowired
	ConditionManager conditionManager;

	@RequestMapping(value = "/secure/manageUsers", method = RequestMethod.GET)
	public ModelAndView getAllUser(
			@RequestParam(value = "filter", required = false) String filter)
			throws Exception {

		List<SMOUser> users = userManager.getAllUser();
		List<SMOUser> doctors = new ArrayList<SMOUser>();
		List<SMOUser> admins = new ArrayList<SMOUser>();
		List<SMOUser> hospitals = new ArrayList<SMOUser>();
		List<SMOUser> patient = new ArrayList<SMOUser>();
		if (users != null) {
			for (SMOUser user : users) {
				if (user.getRoles() != null) {
					if (user.getRoles().contains(AppConstants.ROLE_DOCTOR)) {
						doctors.add(user);

					} else if (user.getRoles().contains(
							AppConstants.ROLE_HOSPITAL)) {
						hospitals.add(user);

					} else if (user.getRoles()
							.contains(AppConstants.ROLE_ADMIN)) {
						admins.add(user);

					} else {
						patient.add(user);
					}

				}

			}
		}
		ModelAndView m = new ModelAndView();
		if (filter != null) {
			if (filter.equalsIgnoreCase("doctor")) {
				m.addObject("users", doctors);
			} else if (filter.equalsIgnoreCase("patient")) {
				m.addObject("users", patient);
			} else if (filter.equalsIgnoreCase("hospitals")) {
				m.addObject("users", hospitals);
			} else if (filter.equalsIgnoreCase("admin")) {
				m.addObject("users", admins);
			} else {
				m.addObject("users", users);
			}
		} else {
			m.addObject("users", users);
		}
		m.addObject("user", new SMOUser());
		m.addObject("doctorSize", doctors.size());
		m.addObject("patientSize", patient.size());
		m.addObject("hospitalSize", hospitals.size());
		m.addObject("adminSize", admins.size());
		m.addObject(
				"usersSize",
				doctors.size() + patient.size() + hospitals.size()
						+ admins.size());
		m.setViewName("secure/adminManageUser");
		return m;

	}

	@RequestMapping(value = "/secure/lockUser", method = RequestMethod.POST)
	public String lockUser(@Param("id") String id, HttpServletRequest request)
			throws Exception {

		userManager.lockUser(id);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/secure/unlockUser", method = RequestMethod.POST)
	public String unlockUser(@Param("id") String id, HttpServletRequest request)
			throws Exception {

		userManager.unlockUser(id);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/registrationApprove")
	public String activateAccount(@Param("id") String id,
			HttpServletRequest request) throws Exception {

		userManager.registrationApprove(id);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/secure/addUserByAdmin", method = RequestMethod.POST)
	public String addUserByAdmin(@ModelAttribute("user") SMOUser user,
			BindingResult result) {

		userManager.addUser(user);
		return "redirect:manageUsers";

	}

	@RequestMapping("/secure/createSpecilityPage")
	public ModelAndView getSpecilityPage() {
		ModelAndView m = new ModelAndView();
		m.addObject("specility", new SMOSpecility());
		m.addObject("alllSpecility", specilityManager.getllSpecility());
		m.setViewName("secure/addSpecilityAdmin");
		return m;
	}

	@RequestMapping(value = "/secure/createSpecilityPage", method = RequestMethod.POST)
	public String createSpecilityPage(
			@ModelAttribute("specility") SMOSpecility specility,
			HttpServletRequest request, BindingResult result) {
		specilityManager.addSpecility(specility);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = "/secure/deleteSpecility", method = RequestMethod.POST)
	public String deleteSpecilityPage(@Param("id") String id,
			HttpServletRequest request) {
		specilityManager.deleteSpecility(id);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping("/secure/addCity")
	public ModelAndView getCityPage() {
		ModelAndView m = new ModelAndView();
		m.addObject("city", new SMOCity());
		m.addObject("allCity", cityManager.getAllCities());
		m.setViewName("secure/addCityAdmin");
		return m;
	}

	@RequestMapping(value = "/secure/addCity", method = RequestMethod.POST)
	public String createCiryPage(@ModelAttribute("city") SMOCity city,
			HttpServletRequest request, BindingResult result) {
		cityManager.addCity(city);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = "/secure/deleteCity", method = RequestMethod.POST)
	public String deleteCiryPage(@Param("id") String id,
			HttpServletRequest request) {
		cityManager.deleteCity(id);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = { "{sa}/cityAutoComplete","/cityAutoComplete" }, method = RequestMethod.GET)
	public @ResponseBody
	String getSearchKeyWords(@RequestParam("keyword") String keyword) {
		List<SMOCity> cities = null;
		if (keyword != null) {
			cities = cityManager.searchCityByName(keyword);
		}
		if (cities.size() ==0) {
			cities = cityManager.searchCityByRegex(keyword);
		}
		if (cities == null) {
			cities = new ArrayList<SMOCity>();
		}
		Gson g = new Gson();
		return g.toJson(cities);

	}
	

	@RequestMapping("/secure/createProceduresPage")
	public ModelAndView getProceduresPage() {
		ModelAndView m = new ModelAndView();
		m.addObject("procedure", new SMOProcedure());
		m.addObject("allProcedure", proceduresManager.getallProcedure());
		m.setViewName("secure/addProcedureAdmin");
		return m;
	}

	@RequestMapping(value = "/secure/createProceduresPage", method = RequestMethod.POST)
	public String createProceduresPage(
			@ModelAttribute("procedure") SMOProcedure procedure,
			HttpServletRequest request, BindingResult result) {
		proceduresManager.addProcedure(procedure);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = "/secure/deleteProcedure", method = RequestMethod.POST)
	public String deleteProceduresPage(@Param("id") String id,
			HttpServletRequest request) {
		proceduresManager.deleteProcedure(id);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping("/secure/createConditionPage")
	public ModelAndView getConditionPage() {
		ModelAndView m = new ModelAndView();
		m.addObject("condition", new SMOCondition());
		m.addObject("allCondition", conditionManager.getallConditions());
		m.setViewName("secure/addConditionsAdmin");
		return m;
	}

	@RequestMapping(value = "/secure/createConditionPage", method = RequestMethod.POST)
	public String createConditionPage(
			@ModelAttribute("condition") SMOCondition condition,
			HttpServletRequest request, BindingResult result) {
		conditionManager.addCondition(condition);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = "/secure/deleteCondition", method = RequestMethod.POST)
	public String deleteConditionPage(@Param("id") String id,
			HttpServletRequest request) {
		conditionManager.deleteCondition(id);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

}
