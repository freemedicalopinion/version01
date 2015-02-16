package com.smo.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
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
import org.springframework.web.servlet.ModelAndView;

import com.smo.constant.AppConstants;
import com.smo.manager.ConditionManager;
import com.smo.manager.DoctorManager;
import com.smo.manager.HospitalManager;
import com.smo.manager.ProceduresManager;
import com.smo.manager.SpecilityManager;
import com.smo.model.SMOAwards;
import com.smo.model.SMOCondition;
import com.smo.model.SMODoctor;
import com.smo.model.SMOHospital;
import com.smo.model.SMOProcedure;
import com.smo.model.SMOSpecility;
import com.smo.utility.UserUtility;

@Controller
public class CommonController {

	@Autowired
	DoctorManager docManager;
	@Autowired
	HospitalManager hospitalManager;
	@Autowired
	SpecilityManager specilityManager;
	@Autowired
	ProceduresManager proceduresManager;
	@Autowired
	ConditionManager conditionManager;

	@RequestMapping("/secure/aboutme")
	public ModelAndView manageAboutMePage() {
		ModelAndView m = new ModelAndView();

		String username = UserUtility.getLoggedInUserUserName();
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			SMODoctor doc = docManager.getDoctorByUsername(username);
			if (doc != null) {
				m.addObject("aboutMe", doc.getAboutMe());
			} else {
				m.addObject("aboutMe", null);
			}
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			SMOHospital hospital = hospitalManager.getHospitalByName(username);
			if (hospital != null) {
				m.addObject("aboutMe", hospital.getAboutUs());
			} else {
				m.addObject("aboutMe", null);
			}
		}
		m.setViewName("secure/commonAbout");
		return m;

	}

	@RequestMapping(value = "/secure/addAboutme", method = RequestMethod.POST)
	public String addAboutMePage(@Param("aboutme") String aboutme,
			HttpServletRequest request) {
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			docManager.addAboutMe(aboutme);
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			hospitalManager.addAboutUs(aboutme);

		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping("/secure/awards")
	public ModelAndView manageawardsPage() {
		String user = UserUtility.getLoggedInUserUserName();
		List<SMOAwards> awards = null;
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			SMODoctor doc = docManager.getDoctorByUsername(user);
			if (doc != null) {
				awards = doc.getAwards();
			}

		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			SMOHospital hospital = hospitalManager.getHospitalByName(user);
			if (hospital != null) {
				awards = hospital.getAwards();
			}
		}
		ModelAndView m = new ModelAndView();

		if (awards != null) {
			Collections.sort(awards, new Comparator<SMOAwards>() {
				public int compare(SMOAwards arg0, SMOAwards arg1) {
					return arg1.getDate().compareTo(arg0.getDate());
				}
			});
		}

		m.addObject("docAwards", awards);
		m.addObject("awards", new SMOAwards());
		m.setViewName("secure/commonawards");
		return m;
	}

	@RequestMapping("/secure/addDoctorAwards")
	public String addAwards(@ModelAttribute("awards") SMOAwards awards,
			HttpServletRequest request, BindingResult result) {
		Date d = new Date();
		long timeStamp = d.getTime();
		awards.setId(timeStamp);
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			docManager.addDoctorAwards(awards);
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			hospitalManager.addHospitalAwards(awards);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/editDoctorAwards")
	public String editAwards(@ModelAttribute("awards") SMOAwards awards,
			HttpServletRequest request, BindingResult result) {
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			docManager.editDoctorAwards(awards);
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			hospitalManager.editHospitalAwards(awards);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/deleteDoctorAward")
	public String deleteAwards(@Param("id") String id,
			HttpServletRequest request) {
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			docManager.deleteDoctorAwards(id);
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			hospitalManager.deleteHospitalAwards(id);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/specilites")
	public ModelAndView manageSpecilitesPage() {
		ModelAndView m = new ModelAndView();
		String user = UserUtility.getLoggedInUserUserName();
		List<String> allSpecilitiesForDoc = null;
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			SMODoctor doc = docManager.getDoctorByUsername(user);
			if (doc != null) {
				allSpecilitiesForDoc = doc.getSpecilities();
			}
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			SMOHospital hospital = hospitalManager.getHospitalByName(user);
			if (hospital != null) {
				allSpecilitiesForDoc = hospital.getSpecilities();
			}
		}

		List<SMOSpecility> docSpecilities = new ArrayList<SMOSpecility>();
		List<SMOSpecility> allSpecilities = specilityManager.getllSpecility();
		if (allSpecilities != null && allSpecilitiesForDoc != null) {
		
			for (String id : allSpecilitiesForDoc) {
				Iterator<SMOSpecility> iter = allSpecilities.iterator();
				while (iter.hasNext()) {
					SMOSpecility e = iter.next();
					if (e.getId().equalsIgnoreCase(id)) {
						iter.remove();
						docSpecilities.add(e);
						break;
					}
				}
			}
		}
		m.addObject("specilitiesToAdd", new ArrayList<String>());
		m.addObject("allSpecilities", allSpecilities);
		m.addObject("docSpecilities", docSpecilities);
		m.setViewName("secure/doctorSpecilities");
		return m;

	}

	@RequestMapping(value = "/secure/addSpecilites", method = RequestMethod.POST)
	public String addSpecilities(
			@RequestParam("specilitiesToAdd[]") String[] paramValues,
			HttpServletRequest request) {
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			docManager.addDoctorSpecilites(paramValues);
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			hospitalManager.addHospitalSpecilites(paramValues);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/deleteSpecilities")
	public String deleteSpecilties(@Param("id") String id,
			HttpServletRequest request) {
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			docManager.deleteDoctorSpecility(id);
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			hospitalManager.deleteHospitalSpecility(id);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/Procedures")
	public ModelAndView manageProceduresPage() {
		ModelAndView m = new ModelAndView();
		String user = UserUtility.getLoggedInUserUserName();
		List<String> allProceduresForDoc = null;
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			SMODoctor doc = docManager.getDoctorByUsername(user);
			if (doc != null) {
				allProceduresForDoc = doc.getProcedures();
			}
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			SMOHospital hospital = hospitalManager.getHospitalByName(user);
			if (hospital != null) {
				allProceduresForDoc = hospital.getProcedures();
			}
		}

		List<SMOProcedure> docProcedures = new ArrayList<SMOProcedure>();
		List<SMOProcedure> allProcedures = proceduresManager.getallProcedure();
		if (allProcedures != null && allProceduresForDoc != null) {
			Iterator<SMOProcedure> iter = allProcedures.iterator();
			for (String id : allProceduresForDoc) {
				while (iter.hasNext()) {
					SMOProcedure e = iter.next();
					if (e.getId().equalsIgnoreCase(id)) {
						iter.remove();
						docProcedures.add(e);
						break;
					}
				}
			}
		}
		m.addObject("proceduresToAdd", new ArrayList<String>());
		m.addObject("allProcedures", allProcedures);
		m.addObject("docProcedures", docProcedures);
		m.setViewName("secure/doctorProcedure");
		return m;

	}

	@RequestMapping(value = "/secure/addProcedures", method = RequestMethod.POST)
	public String addProcedures(
			@RequestParam("proceduresToAdd[]") String[] paramValues,
			HttpServletRequest request) {
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			docManager.addDoctorProcedures(paramValues);
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			hospitalManager.addHospitalProcedures(paramValues);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/deletePocedures")
	public String deleteProcedures(@Param("id") String id,
			HttpServletRequest request) {
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			docManager.deleteDoctorProcedure(id);
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			hospitalManager.deleteHospitalProcedure(id);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	

	@RequestMapping("/secure/Conditions")
	public ModelAndView manageConditionPage() {
		ModelAndView m = new ModelAndView();
		String user = UserUtility.getLoggedInUserUserName();
		List<String> allConditionsForDoc = null;
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			SMODoctor doc = docManager.getDoctorByUsername(user);
			if (doc != null) {
				allConditionsForDoc = doc.getCondition();
			}
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			SMOHospital hospital = hospitalManager.getHospitalByName(user);
			if (hospital != null) {
				allConditionsForDoc = hospital.getCondition();
			}
		}

		List<SMOCondition> docConditions = new ArrayList<SMOCondition>();
		List<SMOCondition> allConditions = conditionManager.getallConditions();
		if (allConditions != null && allConditionsForDoc != null) {
			Iterator<SMOCondition> iter = allConditions.iterator();
			for (String id : allConditionsForDoc) {
				while (iter.hasNext()) {
					SMOCondition e = iter.next();
					if (e.getId().equalsIgnoreCase(id)) {
						iter.remove();
						docConditions.add(e);
						break;
					}
				}
			}
		}
		m.addObject("conditionsToAdd", new ArrayList<String>());
		m.addObject("allConditions", allConditions);
		m.addObject("docConditions", docConditions);
		m.setViewName("secure/doctorCondition");
		return m;

	}

	@RequestMapping(value = "/secure/addConditions", method = RequestMethod.POST)
	public String addConditions(
			@RequestParam("conditionsToAdd[]") String[] paramValues,
			HttpServletRequest request) {
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			docManager.addDoctorConditions(paramValues);
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			hospitalManager.addHospitalCondition(paramValues);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/deleteCondition")
	public String deleteCondition(@Param("id") String id,
			HttpServletRequest request) {
		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_DOCTOR)) {
			docManager.deleteDoctorCondition(id);
		} else if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_HOSPITAL)) {
			hospitalManager.deleteHospitalCondition(id);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}
}
