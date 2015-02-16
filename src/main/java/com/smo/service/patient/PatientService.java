package com.smo.service.patient;

import com.smo.model.SMOPatient;

public interface PatientService {

	public void addPatient(SMOPatient paient);
	public SMOPatient getPatientByUserName(String username);
	

}
