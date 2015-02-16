package com.smo.service.patient;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOPatient;
import com.smo.repository.PatientRepository;

@Service
public class PatientServiceImpl implements PatientService {

	@Autowired
	PatientRepository patientRepo;

	@Override
	public void addPatient(SMOPatient patient) {
		patientRepo.save(patient);
	}

	@Override
	public SMOPatient getPatientByUserName(String username) {
		List<SMOPatient> patientList = patientRepo.findByUsername(username);
		if (patientList != null && patientList.size() > 0) {
			return patientList.get(0);
		}
		return null;
	}

}
