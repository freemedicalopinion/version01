package com.smo.constant;

import java.util.Arrays;
import java.util.List;

public class RoleEnum {

	public enum AdminUserUrls {

		Urls(Arrays.asList(new String[] { "welcome", "addCity", "deleteCity",
				"createSpecilityPage", "deleteSpecility",
				"manageContentCategory", "removeContentCategory",
				"addContentCategory", "addBlogPage", "addBlog",
				"addKeywordsToBlog", "removeKeywordFormBlog",
				"addImagesToBlog", "manageOldBlogPage", "editBlogPage",
				"createDraft", "deleteBlog", "publishBlog", "rejectBlog",
				"sendForApprovalBlog", "blogTimeLine", "blogApprovalPage",
				"manageUsers", "unlockUser", "registrationApprove", "lockUser",
				"addUserByAdmin", "internalUserLogin", "loginasAdmin",
				"manageFAQs", "addFAQs", "removeFAQ", "createProceduresPage",
				"deleteProcedure", "createConditionPage", "deleteCondition","addKeyword" }));

		AdminUserUrls(List<String> adminUserUrlsList) {
			this.adminUserUrlsList = adminUserUrlsList;
		}

		List<String> adminUserUrlsList;

		public static List<String> getAdminUserUrlsList() {

			return AdminUserUrls.Urls.adminUserUrlsList;
		}

	}

	public enum DoctorUserUrls {

		Urls(Arrays.asList(new String[] { "welcome", "doctorpersonalinfo",
				"addDoctorPersonalInfo", "manageProfilePicture",
				"changePassword", "aboutme", "addAboutme", "awards",
				"addDoctorAwards", "editDoctorAwards", "deleteDoctorAward",
				"specilites", "addSpecilites", "deleteSpecilities",
				"education", "addDoctorEducation", "editDoctorEducation",
				"deleteDoctorEducation", "workExperience", "addWorkExperience",
				"editWorkExperience", "deleteWorkExperience", "practiceInfo",
				"addPractice", "addBlogPage", "addBlog", "addKeywordsToBlog",
				"removeKeywordFormBlog", "addImagesToBlog",
				"manageOldBlogPage", "editBlogPage", "createDraft",
				"deleteBlog", "sendForApprovalBlog", "blogTimeLine",
				"loginasAdmin", "Procedures", "addProcedures",
				"deletePocedures", "Conditions", "addConditions",
				"deleteCondition", "medicalRegistration",
				"addMedicalRegistration", "editMedicalRegistration",
				"deleteDoctorReg" }));
		DoctorUserUrls(List<String> doctorUserUrlsList) {
			this.doctorUserUrlsList = doctorUserUrlsList;
		}

		List<String> doctorUserUrlsList;

		public static List<String> getDoctorUserUrlsList() {

			return DoctorUserUrls.Urls.doctorUserUrlsList;
		}

	}

	public enum HospitalUserUrls {
		Urls(Arrays.asList(new String[] { "welcome", "manageHopitalInfo",
				"services", "addServices", "deleteServices",
				"manageProfilePicture", "changePassword", "aboutme",
				"addAboutme", "awards", "addDoctorAwards", "editDoctorAwards",
				"deleteDoctorAward", "specilites", "addSpecilites",
				"deleteSpecilities", "addBlogPage", "addBlog",
				"addKeywordsToBlog", "removeKeywordFormBlog",
				"addImagesToBlog", "manageOldBlogPage", "editBlogPage",
				"createDraft", "deleteBlog", "sendForApprovalBlog",
				"blogTimeLine", "loginasAdmin", "Procedures", "addProcedures",
				"deletePocedures", "Conditions", "addConditions",
				"deleteCondition", "addHospitalContactInfo",
				"addHospitalURLInfo", "addHospitalPhoneInfo" }));

		HospitalUserUrls(List<String> hospitalUserUrlsList) {
			this.hospitalUserUrlsList = hospitalUserUrlsList;
		}

		List<String> hospitalUserUrlsList;

		public static List<String> getHospitalUserUrlsList() {

			return HospitalUserUrls.Urls.hospitalUserUrlsList;
		}

	}

	public enum PatientUserUrls {
		Urls(Arrays.asList(new String[] { "welcome", "userProfile",
				"addPatientPersonalInfo", "addBlogPage", "addBlog",
				"addKeywordsToBlog", "removeKeywordFormBlog",
				"addImagesToBlog", "manageOldBlogPage", "editBlogPage",
				"createDraft", "deleteBlog", "sendForApprovalBlog",
				"blogTimeLine", "loginasAdmin" }));

		PatientUserUrls(List<String> patientUserUrlsList) {
			this.patientUserUrlsList = patientUserUrlsList;
		}

		List<String> patientUserUrlsList;

		public static List<String> getPatientUserUrlsList() {

			return PatientUserUrls.Urls.patientUserUrlsList;
		}

	}

}
