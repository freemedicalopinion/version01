package com.smo.manager;

import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.constant.AppConstants;
import com.smo.model.SMODoctor;
import com.smo.model.SMOHospital;
import com.smo.model.SMOTmpToken;
import com.smo.model.SMOUser;
import com.smo.repository.BlogCustomQuery;
import com.smo.service.user.UserService;
import com.smo.utility.CodeGenerator;
import com.smo.utility.Encryption;
import com.smo.utility.UserUtility;

@Component
public class UserManager {
	@Autowired
	UserService userService;
	@Autowired
	TmpTokenManager tmpTokenManager;
	@Autowired
	DoctorManager doctorManager;
	@Autowired
	HospitalManager hospitalManager;
	@Autowired
	BlogCustomQuery blogCustomQuery;

	public List<SMOUser> getAllUser() {

		return userService.getAllUsers();
	}

	/**
	 * Create User by Admin
	 * */
	public void addUser(SMOUser user) {
		Encryption e = new Encryption();
		SMOTmpToken userToken = new SMOTmpToken();

		user.setCreatedDate(new Date());
		String emailVerificationCode = CodeGenerator.getEmailVerificationCode();
		try {
			user.setPassword(e.encryption(CodeGenerator.getRandomPassword()));
		} catch (GeneralSecurityException e1) {
			e1.printStackTrace();
		}
		user.setAccountNonLocked(false);
		userService.addUser(user);
		addUserEntryInRoleTable(user);
		userToken.setUserId(user.getUsername());
		userToken.setEmailVerificationToken(emailVerificationCode);
		tmpTokenManager.addTmpTokenForUser(userToken);
	}
	
	public void addUserEntryInRoleTable(SMOUser user){
		if(user.getRoles().contains(AppConstants.ROLE_DOCTOR)){
			SMODoctor doc=new SMODoctor();
			doc.setUsername(user.getUsername());
			doc.setFname(user.getFname());
			doc.setLname(user.getLname());
			doctorManager.addDoc(doc);
		}else if(user.getRoles().contains(AppConstants.ROLE_HOSPITAL)){
			SMOHospital hospital=new SMOHospital();
			hospital.setUsername(user.getUsername());
			hospital.setName(user.getFname());
			hospitalManager.addHospital(hospital);;
		}
	}

	public void updateProfilePicture(String profilePicture){
		String user=UserUtility.getLoggedInUserUserName();
		SMOUser dbuser = userService.getUserByUserName(user);
		dbuser.setProfilePicture(profilePicture);
		userService.updateUser(dbuser);
	}
	
	public void lockUser(String email) {
		SMOUser user = userService.getUserByUserName(email);
		user.setAccountNonLocked(false);
		userService.updateUser(user);
	}

	public void unlockUser(String email) {
		SMOUser user = userService.getUserByUserName(email);
		user.setAccountNonLocked(true);
		userService.updateUser(user);
	}

	public void registrationApprove(String id) {
		SMOUser u = userService.getUserByUserName(id);
		u.setRegisterationApproved(true);
		// sendmail
		userService.updateUser(u);
	}
	public void changePassword(String userName,String password) throws GeneralSecurityException {
		SMOUser u = userService.getUserByUserName(userName);
		Encryption e=new Encryption();
		u.setPassword(e.encryption(password));
		userService.updateUser(u);
		
	}
	
	public int getTotalCount(){
		return userService.getTotalCount();
	}
	
	public List<SMOUser> getUsersByRoles(List<String> roles, int limit){
		return blogCustomQuery.getUsersByRoles(roles, limit);
	}
	
	public SMOUser getUserByUserName(String username){
		return userService.getUserByUserName(username);
	}
}
