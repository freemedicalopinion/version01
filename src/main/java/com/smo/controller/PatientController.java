package com.smo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.smo.manager.PatientManager;
import com.smo.model.SMOPatient;

@Controller
public class PatientController {
	@Autowired
	PatientManager patientManager;

	@RequestMapping("/secure/userProfile")
	public ModelAndView getAddPtientForm() {

		SMOPatient p = patientManager.getLoggedInPatient();
		ModelAndView m = new ModelAndView();
		m.addObject("dbsmoPatient", p);
		m.addObject("smoPatient", new SMOPatient());
		m.setViewName("secure/patientPersonalInfo");
		return m;

	}

	@RequestMapping("/secure/addPatientPersonalInfo")
	public String addPatientPersonalForm(
			@ModelAttribute("smoPatient") SMOPatient patient,
			HttpServletRequest request, BindingResult result) {
		patientManager.addPatient(patient);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}
}
