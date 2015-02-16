package com.smo.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOCondition;
import com.smo.service.conditions.ConditionService;

@Component
public class ConditionManager {

	@Autowired
	ConditionService conditionService;

	public void addCondition(SMOCondition smoCondition) {
		if (smoCondition.getConditionName() != null
				&& !smoCondition.getConditionName().equalsIgnoreCase("")) {
			conditionService.addCondition(smoCondition);
		}

	}

	public void editCondition(SMOCondition smoCondition) {
		if (smoCondition.getConditionName() != null
				&& !smoCondition.getConditionName().equalsIgnoreCase("")) {
			conditionService.addCondition(smoCondition);
		}
	}

	public List<SMOCondition> getallConditions() {
		return conditionService.getAllCondition();
	}

	public void deleteCondition(String id) {
		SMOCondition condition = conditionService.findById(id);
		if (condition != null) {
			conditionService.deleteCondition(condition);
		}
	}

}
