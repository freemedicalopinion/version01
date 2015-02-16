package com.smo.service.procedures;

import java.util.List;

import com.smo.model.SMOProcedure;

public interface ProcedureService {

	public void addProcedure(SMOProcedure smoProcedure);

	public List<SMOProcedure> getAllProcedures();
	public void deleteProcedure(SMOProcedure smoProcedure);
	public SMOProcedure findById(String id);

}
