package com.smo.manager;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.stereotype.Component;

import com.mongodb.DBObject;
import com.smo.model.SMOAwards;
import com.smo.model.SMOHospital;
import com.smo.service.hospital.HospitalService;
import com.smo.utility.UserUtility;

@Component
public class HospitalManager {
	@Autowired
	HospitalService hospitalService;

	public void addHospital(SMOHospital hospital) {
		SMOHospital hosDB = getHospitalByName(hospital.getUsername());
		if (hosDB != null) {
			hospital.setId(hosDB.getId());
		}
		hospitalService.addHospital(hospital);
	}

	public SMOHospital getHospitalByName(String hospitalName) {
		return hospitalService.getHospitalByName(hospitalName);

	}

	public void addSocialInfo(SMOHospital hospital) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital dbhospital = getHospitalByName(user);
		if (dbhospital == null) {
			dbhospital = new SMOHospital();
		}
		dbhospital.setWebsiteUrl(hospital.getWebsiteUrl());
		dbhospital.setSocial(hospital.getSocial());
		addHospital(dbhospital);
	}

	public void addAddressInfo(SMOHospital hospital) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital dbhospital = getHospitalByName(user);
		if (dbhospital == null) {
			dbhospital = new SMOHospital();
		}
		dbhospital.setContact(hospital.getContact());
		addHospital(dbhospital);
	}

	public void addPhoneInfo(SMOHospital hospital) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital dbhospital = getHospitalByName(user);
		if (dbhospital == null) {
			dbhospital = new SMOHospital();
		}
		dbhospital.setPhone(hospital.getPhone());
		addHospital(dbhospital);
	}

	public void addAboutUs(String aboutUs) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital hospital = getHospitalByName(user);
		if (hospital == null) {
			hospital = new SMOHospital();
			hospital.setUsername(user);
		}
		hospital.setAboutUs(aboutUs);
		addHospital(hospital);
	}

	public void addHospitalAwards(SMOAwards awards) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital hospital = getHospitalByName(user);
		if (hospital == null) {

			hospital = new SMOHospital();
			hospital.setUsername(user);
		}
		hospital.addAwards(awards);
		addHospital(hospital);
	}

	public void addHospitalSpecilites(String[] specilites) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital hospital = getHospitalByName(user);
		if (hospital != null && specilites != null) {
			hospital.addAllSpecilities(Arrays.asList(specilites));
			addHospital(hospital);
		} else if (specilites != null) {
			hospital = new SMOHospital();
			hospital.setUsername(user);
			hospital.addAllSpecilities(Arrays.asList(specilites));
			addHospital(hospital);
		}
	}

	public void addHospitalServices(String[] services) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital hospital = getHospitalByName(user);
		if (hospital != null && services != null) {
			hospital.addAllService(Arrays.asList(services));
			addHospital(hospital);
		} else if (services != null) {
			hospital = new SMOHospital();
			hospital.setUsername(user);
			hospital.addAllService(Arrays.asList(services));
			addHospital(hospital);
		}
	}

	public void editHospitalAwards(SMOAwards awards) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital hospital = getHospitalByName(user);
		List<SMOAwards> allAwardsToAdd = new ArrayList<SMOAwards>();
		List<SMOAwards> allAwards = hospital.getAwards();
		if (allAwards != null) {
			for (SMOAwards aw : allAwards) {
				if (aw.getId() == awards.getId()) {
					allAwardsToAdd.add(awards);
				} else {
					allAwardsToAdd.add(aw);
				}
			}
		}
		hospital.setAwards(allAwardsToAdd);
		addHospital(hospital);
	}

	public void deleteHospitalAwards(String id) {
		long idtoLong = Long.parseLong(id);
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital hospital = getHospitalByName(user);
		List<SMOAwards> allAwardsToAdd = new ArrayList<SMOAwards>();
		List<SMOAwards> allAwards = hospital.getAwards();
		if (allAwards != null) {
			for (SMOAwards aw : allAwards) {
				if (aw.getId() != idtoLong) {
					allAwardsToAdd.add(aw);
				}
			}
		}
		hospital.setAwards(allAwardsToAdd);
		addHospital(hospital);
	}

	public void deleteHospitalSpecility(String id) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital hospital = getHospitalByName(user);
		List<String> asp = hospital.getSpecilities();
		if (asp != null) {
			if (asp.contains(id)) {
				asp.remove(id);
			}
		}
		hospital.setSpecilities(asp);
		addHospital(hospital);
	}

	public void deleteHospitalServices(String id) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital hospital = getHospitalByName(user);
		List<String> asp = hospital.getServices();
		if (asp != null) {
			if (asp.contains(id)) {
				asp.remove(id);
			}
		}
		hospital.setServices(asp);
		addHospital(hospital);
	}

	public void addHospitalProcedures(String[] procedures) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital d = getHospitalByName(user);
		if (d != null && procedures != null) {
			d.addAllProcedures(Arrays.asList(procedures));
			addHospital(d);
		} else {
			SMOHospital h = new SMOHospital();
			h.setUsername(user);
			h.addAllProcedures(Arrays.asList(procedures));
			addHospital(h);
		}
	}

	public void addHospitalCondition(String[] conditions) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital d = getHospitalByName(user);
		if (d != null && conditions != null) {
			d.addAllConditions(Arrays.asList(conditions));
			addHospital(d);
		} else {
			SMOHospital h = new SMOHospital();
			h.setUsername(user);
			h.addAllConditions(Arrays.asList(conditions));
			addHospital(h);
		}
	}

	public void deleteHospitalProcedure(String id) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital d = getHospitalByName(user);
		List<String> asp = d.getProcedures();
		if (asp != null) {
			if (asp.contains(id)) {
				asp.remove(id);
			}
		}
		d.setProcedures(asp);
		hospitalService.addHospital(d);
	}

	public void deleteHospitalCondition(String id) {
		String user = UserUtility.getLoggedInUserUserName();
		SMOHospital d = getHospitalByName(user);
		List<String> asp = d.getCondition();
		if (asp != null) {
			if (asp.contains(id)) {
				asp.remove(id);
			}
		}
		d.setCondition(asp);
		hospitalService.addHospital(d);
	}

	public SMOHospital getHospitalById(String id) {
		return hospitalService.getHospitalById(id);
	}

	public List<SMOHospital> getHospitalAllHospital() {
		return hospitalService.findAllHospiital();
	}

	public List<SMOHospital> getLatestHospitals(int limit) {
		return hospitalService.getLatestHospitals(limit);
	}

	public int getTotalCount() {
		return hospitalService.getTotalCount();
	}

	public List<SMOHospital> getHospitalByTextSearch(int count, String... keyWords) {

		return hospitalService.getHospitalByTextSearch( count,  keyWords);
	}

	public List<SMOHospital> getHospitalByRegexSearch(String keyWord) {
		return hospitalService.getHospitalByRegexSearch(keyWord);
	}

	public List<SMOHospital> getHospitals(List<String> hospitals) {
		return hospitalService.getHospitals(hospitals);
	}
	public AggregationResults<DBObject> getAverageRating(String... userIds) {
		return hospitalService.getAverageRating(userIds);
	}
}
