package com.smo.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mongodb.DBObject;
import com.smo.constant.PublicEnums.AvgRating;
import com.smo.manager.BlogCategoryManager;
import com.smo.manager.BlogManager;
import com.smo.manager.CommentManager;
import com.smo.manager.DoctorManager;
import com.smo.manager.HospitalManager;
import com.smo.manager.SpecilityManager;
import com.smo.manager.UserManager;
import com.smo.model.SMOBlog;
import com.smo.model.SMOBlogCategory;
import com.smo.model.SMOComment;
import com.smo.model.SMOContactUs;
import com.smo.model.SMODoctor;
import com.smo.model.SMOHospital;
import com.smo.model.SMOUser;

@Controller
public class HomePageController {

	@Autowired
	private BlogManager blogManager;
	@Autowired
	private DoctorManager doctorManager;
	@Autowired
	private HospitalManager hospitalManager;
	@Autowired
	private UserManager userManager;
	@Autowired
	SpecilityManager specilityManager;
	@Autowired
	BlogCategoryManager blogCategoryManager;
	@Autowired
	CommentManager commentManager;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homePage() {
		
		ArrayList<String> roles = new ArrayList<String>();
		roles.add("doctor");
		/*
		 * 
		 * Get Latest User's with role as "doctor"
		 * */
		List<SMOUser> listOfUsersAsDoctor = userManager.getUsersByRoles(roles, 10);
		List<SMODoctor> listOfDoctors = doctorManager.getLatestDoctorsByLimit(10);
		ArrayList<HashMap<String, String>> docUsers = new ArrayList<HashMap<String,String>>();
		
		for(SMOUser user : listOfUsersAsDoctor){
			HashMap<String, String> usrAsDocMap = new HashMap<String, String>();
			for(SMODoctor doctor : listOfDoctors){
				if(user.getUsername().equalsIgnoreCase(doctor.getUsername())){
					usrAsDocMap.put("username", user.getUsername());
					usrAsDocMap.put("fname", user.getFname());
					usrAsDocMap.put("lname",user.getLname());
					usrAsDocMap.put("id", doctor.getId());
					
					if(user.getProfilePicture()!=null){
						usrAsDocMap.put("profilePicture", user.getProfilePicture());
					}
					if(doctor.getSpecilities()!=null){
						String specilityString = new String();
						for(String smoSpecility : doctor.getSpecilities()){
							specilityString+=specilityManager.getSpecilityById(smoSpecility).getSpecilityName()+",";
						}
						usrAsDocMap.put("specilities",specilityString);
					}
					docUsers.add(usrAsDocMap);
					
				}
			}
		}
		ModelAndView model = new ModelAndView();
		HashMap<String, List<SMOComment>> mapOfBlogComments = new HashMap<String, List<SMOComment>>();
		HashMap<String, String> smoBlogCategoriesMap = new HashMap<String, String>();
		for(SMOBlogCategory smoBlogCategory : blogCategoryManager.getAllContentCategory()){
			smoBlogCategoriesMap.put(smoBlogCategory.getId(), smoBlogCategory.getCategory());
		}
		model.addObject("smoBlogCategoriesMap", smoBlogCategoriesMap);
		model.addObject("latestContent", getLatestContent("blog", 3));
		
		for(SMOBlog smoBlog:getLatestContent("blog", 3)){
			mapOfBlogComments.put(smoBlog.getId(), commentManager.getCommentByContentId(smoBlog.getId()));
		}
		model.addObject("mapOfBlogComments", mapOfBlogComments);
		model.addObject("userWithRoleDoctor", docUsers);
		Map<String, Float> ratingMap = new HashMap<String, Float>();
		Map<String, Integer> countMap = new HashMap<String, Integer>();
		Map<String, Integer> recommendationMap = new HashMap<String, Integer>();
		List<SMODoctor> docs = doctorManager.getLatestDoctorsByLimit(10);
		String[] relatedDoctorIds = new String[docs.size()];
		int tmp = 0;
		for (SMODoctor docObj : docs) {
			relatedDoctorIds[tmp] = docObj.getId();
			tmp++;
		}
		AggregationResults<DBObject> d = doctorManager
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
		Map<String, String> specilityMap = specilityManager
				.getallSpecilityMap();
		
		/*
		 * Get latest User's with role as "hospital"
		 * */
		ArrayList<HashMap<String, String>> listOfHospitalObjects = new ArrayList<HashMap<String,String>>();
		
		ArrayList<String> roleAsHospital = new ArrayList<String>();
		roleAsHospital.add("hospital");
		List<SMOUser> usersAsHospitals = userManager.getUsersByRoles(roleAsHospital, 10);
		List<SMOHospital> hospitals = hospitalManager.getLatestHospitals(10);
		
		for(SMOUser userAsHospital: usersAsHospitals){
			HashMap<String, String> userHospitalMap = new HashMap<String, String>();
			for(SMOHospital hospital : hospitals){
				if(userAsHospital.getUsername().equalsIgnoreCase(hospital.getUsername())){
					userHospitalMap.put("username", userAsHospital.getUsername());
					userHospitalMap.put("profilePicture", userAsHospital.getProfilePicture());
					userHospitalMap.put("id", hospital.getId());
					userHospitalMap.put("name", hospital.getName());
					listOfHospitalObjects.add(userHospitalMap);
				}
			}
		}
		
		Map<String, Float> ratingMapHospital = new HashMap<String, Float>();
		Map<String, Integer> countMapHospital = new HashMap<String, Integer>();
		if (hospitals != null) {
			String[] relatedIdsForHospital = new String[hospitals.size()];
			int tmpHospital = 0;
			for (SMOHospital hospital : hospitals) {
				relatedIdsForHospital[tmpHospital] = hospital.getId();
				tmpHospital++;
			}
			AggregationResults<DBObject> resultHospital = hospitalManager
					.getAverageRating(relatedIdsForHospital);
			List<DBObject> resultHospitalInDBObbject = resultHospital.getMappedResults();

			if (sd != null) {
				for (DBObject obj : resultHospitalInDBObbject) {

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
					ratingMapHospital.put(obj.get("_id").toString(), avgRating);
					countMapHospital.put(obj.get("_id").toString(),
							(Integer) obj.get("count"));

				}
			}
		}

		model.addObject("doctorsByLimit", docs);
		model.addObject("recommendationMap", recommendationMap);
		model.addObject("countMap", countMap);
		model.addObject("ratingMap", ratingMap);
		model.addObject("latestHospitals", listOfHospitalObjects);
		model.addObject("totalUsers", getTotalUsers());
		model.addObject("totalHospitals",getTotalHospitals());
		model.addObject("totalDoctors", getTotalDoctors());
		model.addObject("totalArticles", getTotalArticles());
		
		model.addObject("specilityMap", specilityMap);
		model.addObject("countMapHospital", countMapHospital);
		model.addObject("ratingMapHospital", ratingMapHospital);
		model.addObject("smoContactUs", new SMOContactUs());
		model.setViewName("index");
		return model;

	}

	public List<SMOBlog> getLatestContent(String type, int limit) {
		return blogManager.getLatestContentForHomepage(type, limit);
	}


	public int getTotalUsers() {
		return userManager.getTotalCount();
	}

	public int getTotalDoctors() {
		return doctorManager.getTotalCount();
	}

	public int getTotalHospitals() {
		return hospitalManager.getTotalCount();
	}
	
	public int getTotalArticles(){
		return blogManager.getAllBlogs().size();
	}
}
