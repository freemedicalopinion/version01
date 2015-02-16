package com.smo.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mongodb.DBObject;
import com.smo.constant.PublicEnums.AvgRating;
import com.smo.manager.CommentManager;
import com.smo.manager.ConditionManager;
import com.smo.manager.HospitalManager;
import com.smo.manager.HospitalReviewManager;
import com.smo.manager.ProceduresManager;
import com.smo.manager.SpecilityManager;
import com.smo.manager.UserManager;
import com.smo.model.SMOCondition;
import com.smo.model.SMOHospital;
import com.smo.model.SMOHospitalReviewHistory;
import com.smo.model.SMOProcedure;
import com.smo.model.SMOSpecility;
import com.smo.model.SMOUser;
import com.smo.utility.UserUtility;

@Controller
public class HospitalController {
	@Autowired
	HospitalManager hospitalManager;
	@Autowired
	CommentManager commentManager;
	@Autowired
	SpecilityManager specilityManager;
	@Autowired
	ConditionManager conditionManager;
	@Autowired
	ProceduresManager proceduresManager;
	@Autowired
	HospitalReviewManager hospitalReviewManager;
	@Autowired
	UserManager userManager;

	@RequestMapping("/secure/manageHopitalInfo")
	public ModelAndView getAddHospitalForm() {
		ModelAndView m = new ModelAndView();
		SMOHospital hospital = hospitalManager.getHospitalByName(UserUtility
				.getLoggedInUserUserName());

		m.addObject("dbSmoHopital", hospital);
		m.addObject("smoHopital", new SMOHospital());
		m.setViewName("secure/hospitalInfo");
		return m;

	}

	@RequestMapping(value = "/secure/addHospitalContactInfo", method = RequestMethod.POST)
	public String addHospitalPersonalAddressInfoPost(
			@ModelAttribute("smoHopital") SMOHospital smoHopital,
			HttpServletRequest request, BindingResult result) {
		hospitalManager.addAddressInfo(smoHopital);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/secure/addHospitalURLInfo", method = RequestMethod.POST)
	public String addHospitalPersonalURLInfoPost(
			@ModelAttribute("smoHopital") SMOHospital smoHopital,
			HttpServletRequest request, BindingResult result) {
		hospitalManager.addSocialInfo(smoHopital);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/secure/addHospitalPhoneInfo", method = RequestMethod.POST)
	public String addHospitalPersonalPhoneInfoPost(
			@ModelAttribute("smoHopital") SMOHospital smoHopital,
			HttpServletRequest request, BindingResult result) {
		hospitalManager.addPhoneInfo(smoHopital);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/services")
	public ModelAndView manageServicesPage() {
		ModelAndView m = new ModelAndView();
		String user = UserUtility.getLoggedInUserUserName();
		List<String> allServicesForHospital = null;
		SMOHospital hospital = hospitalManager.getHospitalByName(user);
		if (hospital != null) {
			allServicesForHospital = hospital.getServices();
			List<SMOSpecility> services = new ArrayList<SMOSpecility>();
			List<SMOSpecility> allServices = specilityManager.getllSpecility();
			if (allServices != null && allServicesForHospital != null) {

				for (String id : allServicesForHospital) {
					Iterator<SMOSpecility> iter = allServices.iterator();
					while (iter.hasNext()) {
						SMOSpecility e = iter.next();
						if (e.getId().equalsIgnoreCase(id)) {
							iter.remove();
							services.add(e);
							break;
						}
					}
				}
			}

			m.addObject("servicesToAdd", new ArrayList<String>());
			m.addObject("allServices", allServices);
			m.addObject("hospitalServices", services);
			m.setViewName("secure/hospitalServices");
			return m;
		}
		return null;
	}

	@RequestMapping(value = "/secure/addServices", method = RequestMethod.POST)
	public String addServices(
			@RequestParam("servicesToAdd[]") String[] paramValues,
			HttpServletRequest request) {
		hospitalManager.addHospitalServices(paramValues);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/deleteServices")
	public String deleteSpecilties(@Param("id") String id,
			HttpServletRequest request) {

		hospitalManager.deleteHospitalServices(id);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/hospital/{hospital}", method = RequestMethod.GET)
	public ModelAndView showHospitalPage(
			@PathVariable("hospital") String hospital) {
		ModelAndView m = new ModelAndView();

		SMOHospital hospitalObject = hospitalManager.getHospitalById(hospital);
		SMOUser userAsHospital = userManager.getUserByUserName(hospitalObject.getUsername());
		if (hospitalObject != null) {
			List<String> procedureName = new ArrayList<String>();
			List<String> conditionName = new ArrayList<String>();

			List<SMOHospitalReviewHistory> allReviews = hospitalReviewManager
					.getAllReviewsForHospital(hospital);
			List<String> procedures = hospitalObject.getProcedures();
			List<SMOProcedure> allProcedure = proceduresManager
					.getallProcedure();
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
			hospitalObject.setProcedures(procedureName);

			List<String> conditions = hospitalObject.getCondition();
			List<SMOCondition> allConditions = conditionManager
					.getallConditions();
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

			hospitalObject.setCondition(conditionName);

			List<SMOHospital> relatedHospitalList = new ArrayList<SMOHospital>();
			if (hospitalObject != null
					&& hospitalObject.getSpecilities() != null && !hospitalObject.getSpecilities().isEmpty()) {
				relatedHospitalList = hospitalManager.getHospitalByTextSearch(
						12,
						hospitalObject.getSpecilities().toArray(
								new String[hospitalObject.getSpecilities()
										.size()]));
			}
			String[] relatedDoctorIds = new String[relatedHospitalList.size()];
			int tmp = 0;
			for (SMOHospital docObj : relatedHospitalList) {
				relatedDoctorIds[tmp] = docObj.getId();
				tmp++;
			}
			AggregationResults<DBObject> d = hospitalManager
					.getAverageRating(relatedDoctorIds);
			List<DBObject> sd = d.getMappedResults();
			Map<String, Float> ratingMap = new HashMap<String, Float>();
			Map<String, Integer> countMap = new HashMap<String, Integer>();
			Map<String, Integer> recommendationMap = new HashMap<String, Integer>();

			if (sd != null) {
				for (DBObject obj : sd) {

					Double k = (Double) obj.get(AvgRating.avg_helpfulnessRating
							.toString())
							+ (Double) obj.get(AvgRating.avg_knowledgeRating
									.toString())
							+ (Double) obj.get(AvgRating.avg_punctualityRating
									.toString().toString())
							+ (Double) obj.get(AvgRating.avg_staffRating
									.toString());
					k = k / 4;
					k = Double
							.parseDouble(new DecimalFormat("##.##").format(k));
					String number = String.valueOf(k);

					String numberD = null;
					if (number.contains(".")) {
						numberD = number.substring(number.indexOf(".") + 1);
						number = number.substring(0, number.indexOf("."));
					}

					float avgRating = 0;
					if (numberD != null && Integer.parseInt(numberD) > 50) {
						avgRating = Integer.parseInt(number) + 1;
					} else {
						avgRating = Integer.parseInt(number);
					}
					ratingMap.put(obj.get("_id").toString(), avgRating);
					countMap.put(obj.get("_id").toString(),
							(Integer) obj.get("count"));
					recommendationMap.put(obj.get("_id").toString(),
							(Integer) obj.get("recommendation"));

				}
			}
			if (relatedHospitalList.size() < 4) {
				m.addObject("relatedHospital1", relatedHospitalList);
				m.addObject("relatedHospital2", null);
				m.addObject("relatedHospital3", null);
			} else {
				m.addObject("relatedHospital1",
						relatedHospitalList.subList(0, 4));
				if (relatedHospitalList.size() < 8) {
					m.addObject(
							"relatedHospital2",
							relatedHospitalList.subList(4,
									relatedHospitalList.size()));
					m.addObject("relatedHospital3", null);
				} else {
					m.addObject("relatedHospital2",
							relatedHospitalList.subList(4, 7));
					if (relatedHospitalList.size() < 12) {
						m.addObject("relatedHospital3", relatedHospitalList
								.subList(7, relatedHospitalList.size()));
					} else {
						m.addObject("relatedHospital3",
								relatedHospitalList.subList(7, 11));

					}
				}
			}

			m.addObject("hospitalObject", hospitalObject);
			m.addObject("relatedDoctorReview", ratingMap);
			m.setViewName("hospitalHome");
			m.addObject("recommendationMap", recommendationMap);
			m.addObject("userAsHospital", userAsHospital);
			m.addObject("countMap", countMap);
			m.addObject("addReview", new SMOHospitalReviewHistory());
			m.addObject("allReview", allReviews);
			return m;
		}
		return null;
	}

	@RequestMapping("/searchHospital")
	public ModelAndView searchHospital(
			@RequestParam("hospital") String keyword, HttpServletRequest request) {
		List<SMOHospital> hospitals = hospitalManager.getHospitalByTextSearch(
				0, keyword);

		if (hospitals != null & hospitals.size() == 0) {
			hospitals = hospitalManager.getHospitalByRegexSearch(keyword);
		}
		Map<String, Float> ratingMap = new HashMap<String, Float>();
		Map<String, Integer> countMap = new HashMap<String, Integer>();
		Map<String, Integer> recommendationMap = new HashMap<String, Integer>();
		if (hospitals != null) {
			String[] relatedDoctorIds = new String[hospitals.size()];
			int tmp = 0;
			for (SMOHospital docObj : hospitals) {
				relatedDoctorIds[tmp] = docObj.getId();
				tmp++;
			}
			AggregationResults<DBObject> d = hospitalManager
					.getAverageRating(relatedDoctorIds);
			List<DBObject> sd = d.getMappedResults();

			if (sd != null) {
				for (DBObject obj : sd) {

					Double k = (Double) obj.get(AvgRating.avg_helpfulnessRating
							.toString())
							+ (Double) obj.get(AvgRating.avg_knowledgeRating
									.toString())
							+ (Double) obj.get(AvgRating.avg_punctualityRating
									.toString().toString())
							+ (Double) obj.get(AvgRating.avg_staffRating
									.toString());
					k = k / 4;
					k = Double
							.parseDouble(new DecimalFormat("##.##").format(k));
					String number = String.valueOf(k);

					String numberD = null;
					if (number.contains(".")) {
						numberD = number.substring(number.indexOf(".") + 1);
						number = number.substring(0, number.indexOf("."));
					}

					float avgRating = 0;
					if (numberD != null && Integer.parseInt(numberD) > 50) {
						avgRating = Integer.parseInt(number) + 1;
					} else {
						avgRating = Integer.parseInt(number);
					}
					ratingMap.put(obj.get("_id").toString(), avgRating);
					countMap.put(obj.get("_id").toString(),
							(Integer) obj.get("count"));
					recommendationMap.put(obj.get("_id").toString(),
							(Integer) obj.get("recommendation"));

				}
			}
		}
		ModelAndView m = new ModelAndView();
		m.addObject("hospitals", hospitals);
		m.addObject("recommendationMap", recommendationMap);
		m.addObject("countMap", countMap);
		m.addObject("ratingMap", ratingMap);
		m.setViewName("hospitalSearch");
		return m;
	}

	@RequestMapping("/hospital/addHospitalReivew")
	public String addHospitalReview(
			@ModelAttribute("addReview") SMOHospitalReviewHistory addReview,
			HttpServletRequest request, BindingResult result) {

		if (addReview != null) {
			addReview.setCreatedDate(new Date());
			// is client behind something?
			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}
			addReview.setReviewerIp(ipAddress);
			hospitalReviewManager.addReview(addReview);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = { "{sa}/hospitalAutoComplete",
			"/hospitalAutoComplete" }, method = RequestMethod.GET)
	public @ResponseBody
	String getSearchKeyWords(@RequestParam("keyword") String keyword) {
		List<String> words = new ArrayList<String>();
		List<SMOHospital> hospitals = null;
		if (keyword != null) {
			hospitals = hospitalManager.getHospitalByRegexSearch(keyword);
			if (hospitals == null) {
				hospitals = hospitalManager
						.getHospitalByTextSearch(10, keyword);
			}
		}

		if (hospitals != null) {
			for (SMOHospital hospital : hospitals) {
				words.add(hospital.getName());
			}
		}

		Gson g = new Gson();
		return g.toJson(words);

	}

}
