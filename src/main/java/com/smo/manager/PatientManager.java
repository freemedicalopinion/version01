package com.smo.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOPatient;
import com.smo.service.patient.PatientService;
import com.smo.utility.UserUtility;

@Component
public class PatientManager {

	@Autowired
	PatientService patientService;

	public void addPatient(SMOPatient patient) {
		String username = UserUtility.getLoggedInUserUserName();
		SMOPatient dbpatient = patientService.getPatientByUserName(username);
		if (dbpatient != null) {
			patient.setId(dbpatient.getId());
		}
		patient.setUsername(username);
		patientService.addPatient(patient);
	}

	public SMOPatient getLoggedInPatient() {
		String username = UserUtility.getLoggedInUserUserName();
		return patientService.getPatientByUserName(username);
	}

}
