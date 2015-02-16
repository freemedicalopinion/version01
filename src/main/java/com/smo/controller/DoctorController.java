package com.smo.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
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
import com.smo.manager.BlogManager;
import com.smo.manager.CityManager;
import com.smo.manager.CommentManager;
import com.smo.manager.DoctorManager;
import com.smo.manager.DoctorReviewManager;
import com.smo.manager.HospitalManager;
import com.smo.manager.RegistrationManager;
import com.smo.manager.SpecilityManager;
import com.smo.manager.UserManager;
import com.smo.model.ContentImages;
import com.smo.model.SMOBlog;
import com.smo.model.SMODoctor;
import com.smo.model.SMODoctorRegistration;
import com.smo.model.SMODoctorReviewHistory;
import com.smo.model.SMODoctorTiming;
import com.smo.model.SMOEducation;
import com.smo.model.SMOExperience;
import com.smo.model.SMOHospital;
import com.smo.model.SMOUser;
import com.smo.utility.SMOException;
import com.smo.utility.UserUtility;

@Controller
public class DoctorController {
	@Autowired
	DoctorManager docManager;
	@Autowired
	RegistrationManager usermanager;
	@Autowired
	CommentManager commentManager;
	@Autowired
	CityManager cityManager;
	@Autowired
	DoctorReviewManager doctorReviewManager;
	@Autowired
	HospitalManager hospitalManager;
	@Autowired
	SpecilityManager specilityManager;
	@Autowired
	UserManager userManager;
	@Autowired
	BlogManager blogManager;

	private static final Logger logger = Logger
			.getLogger(DoctorController.class);

	@RequestMapping("/secure/doctorpersonalinfo")
	public ModelAndView addDoctorPersonalInfoPage() {
		logger.info("inside addDoctorPersonalInfoPage()");
		ModelAndView m = new ModelAndView();
		m.addObject("imageModel", new ContentImages());
		String logggedInUser = UserUtility.getLoggedInUserUserName();
		SMODoctor user = docManager.getDoctorByUsername(logggedInUser);
		m.addObject("user", user);
		m.addObject("smoDoctor", new SMODoctor());

		m.setViewName("secure/doctorPersonalInfo");
		return m;

	}

	@RequestMapping(value = "/secure/addDoctorPersonalInfo", method = RequestMethod.POST)
	public String addDoctorPersonalInfoPost(
			@ModelAttribute("smoDoctor") SMODoctor smoDoctor,
			HttpServletRequest request, BindingResult result) {

		docManager.addDocPersonalInfo(smoDoctor);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/secure/addDoctorPersonalInfo", method = RequestMethod.GET)
	public String addDoctorPersonalInfoGet(HttpServletRequest request) {

		return "redirect:doctorpersonalinfo";

	}

	@RequestMapping("/secure/education")
	public ModelAndView manageEducationPage() {
		ModelAndView m = new ModelAndView();
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor doc = docManager.getDoctorByUsername(user);
		List<SMOEducation> edu = null;
		if (doc != null) {
			edu = doc.getEducation();
			if (edu != null) {
				Collections.sort(edu, new Comparator<SMOEducation>() {
					public int compare(SMOEducation arg0, SMOEducation arg1) {

						return arg1.getYearOfCompletion().compareTo(
								arg0.getYearOfCompletion());

					}
				});
			}

		}
		m.addObject("docEducation", edu);
		m.addObject("education", new SMOEducation());
		m.setViewName("secure/doctorEducation");
		return m;
	}

	@RequestMapping("/secure/addDoctorEducation")
	public String addDoctorEductionForm(
			@ModelAttribute("education") SMOEducation education,
			HttpServletRequest request, BindingResult result) {
		Date d = new Date();
		long timeStamp = d.getTime();
		education.setId(timeStamp);
		docManager.addDoctorEducation(education);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/editDoctorEducation")
	public String editDoctorEductionForm(
			@ModelAttribute("education") SMOEducation education,
			HttpServletRequest request, BindingResult result) {
		docManager.editDoctorEducation(education);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/medicalRegistration")
	public ModelAndView manageMedicalRegistrationPage() {
		ModelAndView m = new ModelAndView();
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor doc = docManager.getDoctorByUsername(user);
		List<SMODoctorRegistration> reg = null;
		if (doc != null) {
			reg = doc.getDoctorRegistration();
			if (reg != null) {
				Collections.sort(reg, new Comparator<SMODoctorRegistration>() {
					public int compare(SMODoctorRegistration arg0,
							SMODoctorRegistration arg1) {

						return arg1.getYearOfRegistration().compareTo(
								arg0.getYearOfRegistration());

					}
				});
			}

		}
		m.addObject("docReg", reg);
		m.addObject("reg", new SMODoctorRegistration());
		m.setViewName("secure/doctorMedicalRegistation");
		return m;
	}

	@RequestMapping("/secure/addMedicalRegistration")
	public String addDoctorMedicalRegForm(
			@ModelAttribute("reg") SMODoctorRegistration reg,
			HttpServletRequest request, BindingResult result) {
		docManager.addDoctorRegistration(reg);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/editMedicalRegistration")
	public String editDoctorMedicalRegForm(
			@ModelAttribute("reg") SMODoctorRegistration doctorRegistration,
			HttpServletRequest request, BindingResult result) {
		docManager.editDoctorRegistration(doctorRegistration);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/deleteDoctorEducation")
	public String deleteDoctorEductionForm(@Param("id") String id,
			HttpServletRequest request) {
		docManager.deleteDoctorEducation(id);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/deleteDoctorReg")
	public String deleteDoctorRegForm(@Param("id") String id,
			HttpServletRequest request) {
		docManager.deleteDoctorRegistration(id);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/workExperience")
	public ModelAndView manageWorkExperiencePage() {
		ModelAndView m = new ModelAndView();
		String user = UserUtility.getLoggedInUserUserName();
		SMODoctor doc = docManager.getDoctorByUsername(user);
		List<SMOExperience> edu = null;
		if (doc != null) {
			edu = doc.getExperiences();
			if (edu != null) {
				Collections.sort(edu, new Comparator<SMOExperience>() {
					public int compare(SMOExperience arg0, SMOExperience arg1) {

						return arg1.getEndYear().compareTo(arg0.getEndYear());

					}
				});
			}

		}
		m.addObject("docExperience", edu);
		m.addObject("experience", new SMOExperience());
		m.setViewName("secure/doctorWorkExperience");
		return m;
	}

	@RequestMapping("/secure/addWorkExperience")
	public String addWorkExperience(
			@ModelAttribute("experience") SMOExperience experience,
			HttpServletRequest request, BindingResult result) {
		Date d = new Date();
		long timeStamp = d.getTime();
		experience.setId(timeStamp);
		docManager.addDoctorExperience(experience);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/editWorkExperience")
	public String editWorkExperience(
			@ModelAttribute("experience") SMOExperience experience,
			HttpServletRequest request, BindingResult result) {
		docManager.editDoctorExperience(experience);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/deleteWorkExperience")
	public String deleteWorkExperience(@Param("id") String id,
			HttpServletRequest request) {
		docManager.deleteDoctorExperience(id);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping("/secure/practiceInfo")
	public ModelAndView managePracticeInfoPage() {
		SMODoctor doc = docManager.getDoctorByUsername(UserUtility
				.getLoggedInUserUserName());
		Map<String, SMOHospital> hospitalMap = new HashMap<String, SMOHospital>();
		if (doc != null) {
			List<SMOHospital> hospitalList = hospitalManager
					.getHospitalAllHospital();
			if (hospitalList != null) {
				for (SMOHospital hospital : hospitalList) {

					hospitalMap.put(hospital.getId(), hospital);
				}

			}
		}

		ModelAndView m = new ModelAndView();

		m.addObject("doc", doc);
		m.addObject("hospitalMap", hospitalMap);
		m.addObject("appointment", new SMODoctorTiming());
		m.setViewName("secure/doctorPracticeInfo");
		return m;

	}

	@RequestMapping(value = "/secure/addPractice", method = RequestMethod.POST)
	public String addPractice(
			@ModelAttribute("appointment") SMODoctorTiming timing,
			HttpServletRequest request, BindingResult result) {
		docManager.addDoctorPractice(timing);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping("/doctor/{doctorId}")
	public ModelAndView viewDoctor(@PathVariable("doctorId") String doctorId)
			throws SMOException {
		
		/*
		 * Get Related Doctors
		 * */
		ArrayList<HashMap<String, String>> relatedUserAsDoctor = new ArrayList<HashMap<String,String>>();
		SMODoctor doc = docManager.getDoctorForViewDocScreen(doctorId);
		List<SMODoctor> relatedDoctorList = new ArrayList<SMODoctor>();
		if (doc != null && doc.getSpecilities() != null) {
			relatedDoctorList = docManager.searchDoctorTextSearch(
					12,
					doc.getSpecilities().toArray(
							new String[doc.getSpecilities().size()]));
		}
		String[] relatedDoctorIds = new String[relatedDoctorList.size()];
		int tmp = 0;
		for (SMODoctor docObj : relatedDoctorList) {
			HashMap<String, String> userDoctorMap = new HashMap<String, String>();
			String specilities = new String();
			SMOUser relatedDoctor = usermanager.getUser(docObj.getUsername());
			userDoctorMap.put("id", docObj.getId());
			userDoctorMap.put("profilePicture", relatedDoctor.getProfilePicture());
			userDoctorMap.put("fname", docObj.getFname());
			userDoctorMap.put("lname", docObj.getLname());
			userDoctorMap.put("city", docObj.getCity());
			userDoctorMap.put("username", docObj.getUsername());
			
			for(String specility : docObj.getSpecilities()){
				specilities+=specilityManager.getSpecilityById(specility).getSpecilityName()+",";
			}
			userDoctorMap.put("specilities", specilities);
			relatedUserAsDoctor.add(userDoctorMap);
			relatedDoctorIds[tmp] = docObj.getId();
			tmp++;
		}
		
		List<SMOBlog> listOfBlogsForUserName = blogManager.getLatestBlogByAuthor(doc.getUsername(), 3);
		/*
		 * Get speciality Map
		 * */
		Map<String, String> specilityMap = specilityManager
				.getallSpecilityMap();
		
		AggregationResults<DBObject> d = docManager
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
						+ (Double) obj
								.get(AvgRating.avg_staffRating.toString());
				k = k / 4;
				k = Double.parseDouble(new DecimalFormat("##.##").format(k));
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
		ModelAndView m = new ModelAndView();
		if (doc != null) {
			List<SMODoctorTiming> hospitalList = doc.getHospitals();
			Map<String, SMOHospital> hospitalMap = new HashMap<String, SMOHospital>();
			List<String> hospitalsForDoctor = new ArrayList<String>();

			if (hospitalList != null) {
				for (SMODoctorTiming docTiming : hospitalList) {
					if (docTiming.getHospitalId() != null) {
						hospitalsForDoctor.add(docTiming.getHospitalId());

					}
				}
			}
			List<SMOHospital> hospitals = hospitalManager
					.getHospitals(hospitalsForDoctor);
			if (hospitals != null) {
				for (SMOHospital hos : hospitals) {
					hospitalMap.put(hos.getId(), hos);
				}

			}
			List<SMODoctorReviewHistory> allReviews = doctorReviewManager
					.getAllReviewsForDoctor(doc.getId());
			if (relatedDoctorList.size() < 4) {
				m.addObject("relatedDoctor1", relatedUserAsDoctor);
				m.addObject("relatedDoctor2", null);
				m.addObject("relatedDoctor3", null);
			} else {
				m.addObject("relatedDoctor1", relatedDoctorList.subList(0, 4));
				if (relatedDoctorList.size() < 8) {
					m.addObject(
							"relatedDoctor2",
							relatedDoctorList.subList(4,
									relatedDoctorList.size()));
					m.addObject("relatedDoctor3", null);
				} else {
					m.addObject("relatedDoctor2",
							relatedDoctorList.subList(4, 7));
					if (relatedDoctorList.size() < 12) {
						m.addObject(
								"relatedDoctor3",
								relatedDoctorList.subList(7,
										relatedDoctorList.size()));
					} else {
						m.addObject("relatedDoctor3",
								relatedDoctorList.subList(7, 11));

					}
				}
			}
			
			/*
			 * Get User Object for Profile Picture
			 * */
			SMOUser userByUserName = userManager.getUserByUserName(doc.getUsername());
			m.addObject("listOfBlogsForUserName", listOfBlogsForUserName);
			m.addObject("relatedDoctorReview", ratingMap);
			m.addObject("specilityMap", specilityMap);
			m.addObject("addReview", new SMODoctorReviewHistory());
			m.addObject("allReview", allReviews);
			m.addObject("doc", doc);
			m.addObject("userByUserName", userByUserName);
			m.addObject("recommendationMap", recommendationMap);
			m.addObject("countMap", countMap);
			m.addObject("hopspitalMap", hospitalMap);

		}

		if (doc == null) {
			// throw new SMOException();
		}
		m.setViewName("doctor");
		return m;

	}

	@RequestMapping("/doctor/addReivew")
	public String addDoctorReview(
			@ModelAttribute("addReview") SMODoctorReviewHistory addReview,
			HttpServletRequest request, BindingResult result) {

		if (addReview != null) {
			addReview.setCreatedDate(new Date());
			// is client behind something?
			String ipAddress = request.getHeader("X-FORWARDED-FOR");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}
			addReview.setReviewerIp(ipAddress);
			doctorReviewManager.addReview(addReview);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = { "/searchDoctor","{sa}/searchDoctor"})
	public ModelAndView searchDoctor(@RequestParam("doctor") String keyword,
			@RequestParam("city") String city, HttpServletRequest request) {
		List<SMODoctor> docs = docManager.searchDoctorTextSearch(0, keyword);

		if (docs != null & docs.size() == 0) {
			docs = docManager.searchDoctorRegexSearch(keyword);
		}
		Map<String, Float> ratingMap = new HashMap<String, Float>();
		Map<String, Integer> countMap = new HashMap<String, Integer>();
		Map<String, Integer> recommendationMap = new HashMap<String, Integer>();
		Map<String, SMOHospital> hospitalMap = new HashMap<String, SMOHospital>();
		List<String> hospitalsForDoctor = new ArrayList<String>();
		Map<String, String> specilityMap = specilityManager
				.getallSpecilityMap();
		if (docs != null) {
			String[] relatedDoctorIds = new String[docs.size()];
			int tmp = 0;
			for (SMODoctor docObj : docs) {
				relatedDoctorIds[tmp] = docObj.getId();
				List<SMODoctorTiming> hospitalList = docObj.getHospitals();
				if (hospitalList != null) {
					for (SMODoctorTiming docTiming : hospitalList) {
						if (docTiming.getHospitalId() != null) {
							hospitalsForDoctor.add(docTiming.getHospitalId());

						}
					}
				}
				tmp++;
			}
			List<SMOHospital> hospitals = hospitalManager
					.getHospitals(hospitalsForDoctor);
			if (hospitals != null) {
				for (SMOHospital hos : hospitals) {
					hospitalMap.put(hos.getId(), hos);
				}

			}

			AggregationResults<DBObject> d = docManager
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
		m.addObject("docs", docs);
		m.setViewName("doctorSearch");
		m.addObject("specilityMap", specilityMap);
		m.addObject("recommendationMap", recommendationMap);
		m.addObject("countMap", countMap);
		m.addObject("ratingMap", ratingMap);
		m.addObject("hospitalMap", hospitalMap);
		return m;
	}

	@RequestMapping(value = { "{sa}/doctorAutoComplete", "/doctorAutoComplete" }, method = RequestMethod.GET)
	public @ResponseBody
	String getSearchKeyWords(@RequestParam("keyword") String keyword) {
		List<String> words = new ArrayList<String>();
		List<SMODoctor> docs = null;
		if (keyword != null) {
			docs = docManager.searchDoctorRegexSearch(keyword);
			if (docs == null) {
				docs = docManager.searchDoctorTextSearch(10, keyword);
			}
		}

		if (docs != null) {
			for (SMODoctor doc : docs) {
				words.add(doc.getFname() + " " + doc.getLname());
			}
		}

		Gson g = new Gson();
		return g.toJson(words);

	}
}
