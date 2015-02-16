package com.smo.service.procedures;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOProcedure;
import com.smo.repository.ProceduresRepository;

@Service
public class ProcedureServiceImpl implements ProcedureService {

	@Autowired
	ProceduresRepository proceduresRepository;

	@Override
	public void addProcedure(SMOProcedure smoProcedure) {
		proceduresRepository.save(smoProcedure);

	}

	@Override
	public List<SMOProcedure> getAllProcedures() {
		return proceduresRepository.findAll();
	}

	@Override
	public void deleteProcedure(SMOProcedure smoProcedure) {
		proceduresRepository.delete(smoProcedure);
		
	}

	@Override
	public SMOProcedure findById(String id) {
		// TODO Auto-generated method stub
		return proceduresRepository.findOne(id);
	}

}
