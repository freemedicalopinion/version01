package com.smo.service.specility;

import java.util.List;

import com.smo.model.SMOSpecility;

public interface SpecilityService {

	public void addSpecility(SMOSpecility smoSpecility);

	public List<SMOSpecility> getAllSpecility();
	public void deleteSpecility(SMOSpecility smoSpecility);
	public SMOSpecility findById(String id);

}
