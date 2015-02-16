package com.smo.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOProcedure;
import com.smo.service.procedures.ProcedureService;

@Component
public class ProceduresManager {

	@Autowired
	ProcedureService procedureService;

	public void addProcedure(SMOProcedure smoProcedure) {
		if (smoProcedure.getProcedureName() != null
				&& !smoProcedure.getProcedureName().equalsIgnoreCase("")) {
			procedureService.addProcedure(smoProcedure);
		}

	}

	public void editProcedure(SMOProcedure smoProcedure) {
		if (smoProcedure.getProcedureName() != null
				&& !smoProcedure.getProcedureName().equalsIgnoreCase("")) {
			procedureService.addProcedure(smoProcedure);
		}
	}

	public List<SMOProcedure> getallProcedure() {
		return procedureService.getAllProcedures();
	}

	public void deleteProcedure(String id) {
		SMOProcedure procedure = procedureService.findById(id);
		if (procedure != null) {
			procedureService.deleteProcedure(procedure);
		}
	}

}
