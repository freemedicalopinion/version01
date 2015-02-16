package com.smo.service.specility;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOSpecility;
import com.smo.repository.SpecilityRepository;

@Service
public class SpecilityServiceImpl implements SpecilityService {

	@Autowired
	SpecilityRepository specilityRepository;

	@Override
	public void addSpecility(SMOSpecility smoSpecility) {
		specilityRepository.save(smoSpecility);

	}

	@Override
	public List<SMOSpecility> getAllSpecility() {
		return specilityRepository.findAll();
	}

	@Override
	public void deleteSpecility(SMOSpecility smoSpecility) {
		specilityRepository.delete(smoSpecility);
		
	}

	@Override
	public SMOSpecility findById(String id) {
		// TODO Auto-generated method stub
		return specilityRepository.findOne(id);
	}

}
