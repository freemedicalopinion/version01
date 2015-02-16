package com.smo.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOSpecility;
import com.smo.service.specility.SpecilityService;

@Component
public class SpecilityManager {

	@Autowired
	SpecilityService specilityService;

	public void addSpecility(SMOSpecility smoSpecility) {
		if (smoSpecility.getSpecilityName() != null
				&& !smoSpecility.getSpecilityName().equalsIgnoreCase("")) {
			specilityService.addSpecility(smoSpecility);
		}

	}

	public void editSpecility(SMOSpecility smoSpecility) {
		if (smoSpecility.getSpecilityName() != null
				&& !smoSpecility.getSpecilityName().equalsIgnoreCase("")) {
			specilityService.addSpecility(smoSpecility);
		}
	}

	public List<SMOSpecility> getllSpecility() {
		return specilityService.getAllSpecility();
	}

	public void deleteSpecility(String id) {
		SMOSpecility specility = specilityService.findById(id);
		if (specility != null) {
			specilityService.deleteSpecility(specility);
		}
	}

	public Map<String, String> getallSpecilityMap() {
		List<SMOSpecility> allSpecility = getllSpecility();
		Map<String, String> specilityMap = new HashMap<String, String>();
		if (allSpecility != null) {
			for (SMOSpecility smoSpecility : allSpecility) {
				specilityMap.put(smoSpecility.getId(),
						smoSpecility.getSpecilityName());
			}
		}
		return specilityMap;
	}
	
	public SMOSpecility getSpecilityById(String id){
		return specilityService.findById(id);
	}
}