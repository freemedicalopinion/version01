package com.smo.manager;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.stereotype.Component;

import com.mongodb.DBObject;
import com.smo.model.SMOAwards;
import com.smo.model.SMOCondition;
import com.smo.model.SMODoctor;
import com.smo.model.SMODoctorRegistration;
import com.smo.model.SMODoctorTiming;
import com.smo.model.SMOEducation;
import com.smo.model.SMOExperience;
import com.smo.model.SMOProcedure;
import com.smo.service.doctor.DoctorService;
import com.smo.utility.UserUtility;

@Component
public class DoctorManager {
	@Autowired
	DoctorService docService;
	@Autowired
	SpecilityManager specilityManager;
	@Autowired
	ProceduresManager proceduresManager;
	@Autowired
	ConditionManager conditionManager;

	public void addDoc(SMODoctor doc) {
		docService.addDoctor(doc);
	}

	public void addDocPersonalInfo(SMODoctor doc) {
		String username = UserUtility.getLoggedInUserUserName();
		SMODoctor docDB = getDoctorByUsername(username);
		if (docDB == null) {
			docDB = new SMODoctor();
			docDB.setCity(doc.getCity());
			docDB.setMobile(doc.getMobile());
			docDB.setGender(doc.getGender());
			docDB.setWebsiteURL(doc.getWebsiteURL());

			if (doc.getSocial() != null) {
				docDB.setSocial(doc.getSocial());
			}

			addDoc(docDB);
		} else {
			docDB.setCity(doc.getCity());
			docDB.setMobile(doc.getMobile());
			docDB.setGender(doc.getGender());
			docDB.setWebsiteURL(doc.getWebsiteURL());

			if (doc.getSocial() != null) {
				docDB.setSocial(doc.getSocial());
			}

			addDoc(docDB);
		}

	}

	public SMODoctor getDoctorByUsername(String username) {
		return docService.getDoctorByUsername(username);
	}

	public SMODoctor getDoctorByProfileName(String profileName) {
		return docService.getDoctorByProfileName(profileName);
	}

	public void addAboutMe(String aboutMe) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		if (d != null) {
			d.setAboutMe(aboutMe);
			addDoc(d);
		} else {
			SMODoctor doc = new SMODoctor();
			doc.setUsername(user);
			doc.setAboutMe(aboutMe);
			addDoc(doc);
		}
	}

	public void addDoctorEducation(SMOEducation education) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor doc = getDoctorByUsername(user);
		List<SMOEducation> edu = null;
		if (doc != null) {
			doc.addEducation(education);
			edu = doc.getEducation();
			if (edu != null) {
				Collections.sort(edu, new Comparator<SMOEducation>() {
					public int compare(SMOEducation arg0, SMOEducation arg1) {

						return arg1.getYearOfCompletion().compareTo(
								arg0.getYearOfCompletion());

					}
				});
			}
			addDoc(doc);
		} else {
			doc = new SMODoctor();
			doc.setUsername(user);
			doc.addEducation(education);
			addDoc(doc);
		}
	}

	public void addDoctorRegistration(SMODoctorRegistration doctorRegistration) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor doc = getDoctorByUsername(user);
		List<SMODoctorRegistration> edu = null;
		if (doc != null) {
			doc.addDoctorRegistration(doctorRegistration);
			edu = doc.getDoctorRegistration();
			if (edu != null) {
				Collections.sort(edu, new Comparator<SMODoctorRegistration>() {
					public int compare(SMODoctorRegistration arg0,
							SMODoctorRegistration arg1) {

						return arg1.getYearOfRegistration().compareTo(
								arg0.getYearOfRegistration());

					}
				});
			}
			addDoc(doc);
		} else {
			doc = new SMODoctor();
			doc.setUsername(user);
			doc.addDoctorRegistration(doctorRegistration);
			addDoc(doc);
		}
	}

	public void editDoctorEducation(SMOEducation education) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<SMOEducation> allEducationToAdd = new ArrayList<SMOEducation>();
		if (d != null) {
			List<SMOEducation> allEducation = d.getEducation();
			if (allEducation != null) {
				for (SMOEducation edu : allEducation) {
					if (edu.getId() == education.getId()) {
						allEducationToAdd.add(education);
					} else {
						allEducationToAdd.add(edu);
					}
				}
				Collections.sort(allEducation, new Comparator<SMOEducation>() {
					public int compare(SMOEducation arg0, SMOEducation arg1) {

						return arg1.getYearOfCompletion().compareTo(
								arg0.getYearOfCompletion());

					}
				});
			}
		}

		d.setEducation(allEducationToAdd);
		docService.addDoctor(d);
	}

	public void editDoctorRegistration(SMODoctorRegistration doctorRegistration) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<SMODoctorRegistration> allRegToAdd = new ArrayList<SMODoctorRegistration>();
		if (d != null) {
			List<SMODoctorRegistration> allReg = d.getDoctorRegistration();
			if (allReg != null) {
				for (SMODoctorRegistration reg : allReg) {
					if (reg.getId() == doctorRegistration.getId()) {
						allRegToAdd.add(doctorRegistration);
					} else {
						allRegToAdd.add(reg);
					}
				}
				Collections.sort(allRegToAdd,
						new Comparator<SMODoctorRegistration>() {
							public int compare(SMODoctorRegistration arg0,
									SMODoctorRegistration arg1) {

								return arg1.getYearOfRegistration().compareTo(
										arg0.getYearOfRegistration());

							}
						});
			}
		}

		d.setDoctorRegistration(allRegToAdd);
		docService.addDoctor(d);
	}

	public void deleteDoctorEducation(String id) {
		long idtoLong = Long.parseLong(id);
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<SMOEducation> allEducationToAdd = new ArrayList<SMOEducation>();
		List<SMOEducation> allEducation = d.getEducation();
		if (allEducation != null) {
			for (SMOEducation edu : allEducation) {
				if (edu.getId() != idtoLong) {
					allEducationToAdd.add(edu);
				}
			}
		}
		d.setEducation(allEducationToAdd);
		docService.addDoctor(d);
	}

	public void deleteDoctorRegistration(String id) {
		long idtoLong = Long.parseLong(id);
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<SMODoctorRegistration> allRegToAdd = new ArrayList<SMODoctorRegistration>();
		List<SMODoctorRegistration> allReg = d.getDoctorRegistration();
		if (allReg != null) {
			for (SMODoctorRegistration edu : allReg) {
				if (edu.getId() != idtoLong) {
					allRegToAdd.add(edu);
				}
			}
		}
		d.setDoctorRegistration(allRegToAdd);
		docService.addDoctor(d);
	}

	public void addDoctorExperience(SMOExperience experience) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		if (d != null) {
			d.addExperiences(experience);
			List<SMOExperience> edu = null;
			edu = d.getExperiences();
			if (edu != null) {
				Collections.sort(edu, new Comparator<SMOExperience>() {
					public int compare(SMOExperience arg0, SMOExperience arg1) {

						return arg1.getEndYear().compareTo(arg0.getEndYear());

					}
				});
			}

			addDoc(d);
		} else {
			SMODoctor doc = new SMODoctor();
			doc.setUsername(user);
			doc.addExperiences(experience);
			addDoc(doc);
		}
	}

	public void editDoctorExperience(SMOExperience experience) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<SMOExperience> allExperienceToAdd = new ArrayList<SMOExperience>();
		List<SMOExperience> allExperience = d.getExperiences();
		if (allExperience != null) {
			for (SMOExperience ex : allExperience) {
				if (ex.getId() == experience.getId()) {
					allExperienceToAdd.add(experience);
				} else {
					allExperienceToAdd.add(ex);
				}
			}
			Collections.sort(allExperience, new Comparator<SMOExperience>() {
				public int compare(SMOExperience arg0, SMOExperience arg1) {

					return arg1.getEndYear().compareTo(arg0.getEndYear());

				}
			});
		}
		d.setExperiences(allExperienceToAdd);
		docService.addDoctor(d);
	}

	public void deleteDoctorExperience(String id) {
		long idtoLong = Long.parseLong(id);
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<SMOExperience> allExperienceToAdd = new ArrayList<SMOExperience>();
		List<SMOExperience> allExperience = d.getExperiences();
		if (allExperience != null) {
			for (SMOExperience ex : allExperience) {
				if (ex.getId() != idtoLong) {
					allExperienceToAdd.add(ex);
				}
			}
		}
		d.setExperiences(allExperienceToAdd);
		docService.addDoctor(d);
	}

	public void addDoctorAwards(SMOAwards awards) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		if (d != null) {
			d.addAwards(awards);
			List<SMOAwards> awardsList = d.getAwards();
			if (awardsList != null) {
				Collections.sort(awardsList, new Comparator<SMOAwards>() {
					public int compare(SMOAwards arg0, SMOAwards arg1) {
						return arg1.getDate().compareTo(arg0.getDate());
					}
				});
			}

			addDoc(d);
		} else {
			SMODoctor doc = new SMODoctor();
			doc.setUsername(user);
			doc.addAwards(awards);
			addDoc(doc);
		}
	}

	public void addDoctorSpecilites(String[] specilites) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		if (d != null && specilites != null) {
			d.addAllSpecilities(Arrays.asList(specilites));
			addDoc(d);
		} else {
			SMODoctor doc = new SMODoctor();
			doc.setUsername(user);
			doc.addAllSpecilities(Arrays.asList(specilites));
			addDoc(doc);
		}
	}

	public void addDoctorProcedures(String[] procedures) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		if (d != null && procedures != null) {
			d.addAllProcedures(Arrays.asList(procedures));
			addDoc(d);
		} else {
			SMODoctor doc = new SMODoctor();
			doc.setUsername(user);
			d.addAllProcedures(Arrays.asList(procedures));
			addDoc(doc);
		}
	}

	public void addDoctorConditions(String[] conditions) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		if (d != null && conditions != null) {
			d.addAllConditions(Arrays.asList(conditions));
			addDoc(d);
		} else {
			SMODoctor doc = new SMODoctor();
			doc.setUsername(user);
			d.addAllConditions(Arrays.asList(conditions));
			addDoc(doc);
		}
	}

	public void addDoctorPractice(SMODoctorTiming timing) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		if (d != null && timing != null) {
			List<SMODoctorTiming> allTiming = d.getHospitals();
			if (allTiming != null) {
				Iterator<SMODoctorTiming> iterator = allTiming.iterator();
				while (iterator.hasNext()) {
					SMODoctorTiming t = iterator.next();
					if (t.getHospitalId().equalsIgnoreCase(
							timing.getHospitalId())) {
						iterator.remove();
					}
				}

			}
			d.addHospital(timing);
			addDoc(d);
		} else {
			SMODoctor doc = new SMODoctor();
			doc.setUsername(user);
			d.addHospital(timing);
			addDoc(doc);
		}
	}

	public void editDoctorAwards(SMOAwards awards) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<SMOAwards> allAwardsToAdd = new ArrayList<SMOAwards>();
		List<SMOAwards> allAwards = d.getAwards();
		if (allAwards != null) {
			for (SMOAwards aw : allAwards) {
				if (aw.getId() == awards.getId()) {
					allAwardsToAdd.add(awards);
				} else {
					allAwardsToAdd.add(aw);
				}
			}
		}
		d.setAwards(allAwardsToAdd);
		docService.addDoctor(d);
	}

	public void deleteDoctorAwards(String id) {
		long idtoLong = Long.parseLong(id);
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<SMOAwards> allAwardsToAdd = new ArrayList<SMOAwards>();
		List<SMOAwards> allAwards = d.getAwards();
		if (allAwards != null) {
			for (SMOAwards aw : allAwards) {
				if (aw.getId() != idtoLong) {
					allAwardsToAdd.add(aw);
				}
			}
		}
		d.setAwards(allAwardsToAdd);
		docService.addDoctor(d);
	}

	public void deleteDoctorSpecility(String id) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<String> asp = d.getSpecilities();
		if (asp != null) {
			if (asp.contains(id)) {
				asp.remove(id);
			}
		}
		d.setSpecilities(asp);
		docService.addDoctor(d);
	}

	public List<SMODoctor> getLatestDoctorsByLimit(int limit) {
		return docService.getLatestDoctorsByLimit(limit);
	}

	public void deleteDoctorProcedure(String id) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<String> asp = d.getProcedures();
		if (asp != null) {
			if (asp.contains(id)) {
				asp.remove(id);
			}
		}
		d.setProcedures(asp);
		docService.addDoctor(d);
	}

	public void deleteDoctorCondition(String id) {
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor d = getDoctorByUsername(user);
		List<String> asp = d.getCondition();
		if (asp != null) {
			if (asp.contains(id)) {
				asp.remove(id);
			}
		}
		d.setCondition(asp);
		docService.addDoctor(d);
	}

	public SMODoctor getDoctorById(String id) {

		return docService.getDoctorById(id);

	}

	public int getTotalCount() {
		return docService.getTotalCount();
	}

	public SMODoctor getDoctorForViewDocScreen(String id) {

		SMODoctor doc = docService.getDoctorById(id);
		List<String> procedureName = new ArrayList<String>();
		List<String> conditionName = new ArrayList<String>();

		List<String> procedures = doc.getProcedures();
		List<SMOProcedure> allProcedure = proceduresManager.getallProcedure();
		Map<String, String> procedureMap = new HashMap<String, String>();
		if (procedures != null && allProcedure != null) {
			for (SMOProcedure smoProcedure : allProcedure) {
				procedureMap.put(smoProcedure.getId(),
						smoProcedure.getProcedureName());
			}

			for (String procedure : procedures) {
				if (procedureMap.containsKey(procedure)) {
					procedureName.add(procedureMap.get(procedure));
				}
			}
		}
		doc.setProcedures(procedureName);

		List<String> conditions = doc.getCondition();
		List<SMOCondition> allConditions = conditionManager.getallConditions();
		Map<String, String> connditionmap = new HashMap<String, String>();
		if (conditions != null && allConditions != null) {
			for (SMOCondition smoCondition : allConditions) {
				connditionmap.put(smoCondition.getId(),
						smoCondition.getConditionName());
			}

			for (String condition : conditions) {
				if (connditionmap.containsKey(condition)) {
					conditionName.add(connditionmap.get(condition));
				}
			}
		}
		doc.setCondition(conditionName);

		return doc;

	}

	public List<SMODoctor> searchDoctorTextSearch(int limit, String... keyWords) {
		return docService.searchDoctorTextSearch(limit, keyWords);
	}

	public List<SMODoctor> searchDoctorRegexSearch(String keyWord) {
		return docService.searchDoctorRegexSearch(keyWord);
	}

	public AggregationResults<DBObject> getAverageRating(String... userIds) {
		return docService.getAverageRating(userIds);
	}

}
