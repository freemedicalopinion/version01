package com.smo.service.conditions;

import java.util.List;

import com.smo.model.SMOCondition;

public interface ConditionService {

	public void addCondition(SMOCondition smoCondition);

	public List<SMOCondition> getAllCondition();
	public void deleteCondition(SMOCondition smoSpecility);
	public SMOCondition findById(String id);

}
