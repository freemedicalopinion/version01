package com.smo.service.conditions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOCondition;
import com.smo.repository.ConditionRepository;

@Service
public class ConditionServiceImpl implements ConditionService {

	@Autowired
	ConditionRepository conditionRepository;

	@Override
	public void addCondition(SMOCondition smoCondition) {
		conditionRepository.save(smoCondition);

	}

	@Override
	public List<SMOCondition> getAllCondition() {
		return conditionRepository.findAll();
	}

	@Override
	public void deleteCondition(SMOCondition smoCondition) {
		conditionRepository.delete(smoCondition);

	}

	@Override
	public SMOCondition findById(String id) {
		// TODO Auto-generated method stub
		return conditionRepository.findOne(id);
	}

}
