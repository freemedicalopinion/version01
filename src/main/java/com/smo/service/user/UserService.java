package com.smo.service.user;

import java.util.List;

import com.smo.model.SMOUser;

public interface UserService {

	public SMOUser getUserByUserName(String username);

	public boolean addUser(SMOUser user);

	public boolean updateUser(SMOUser user);

	public List<SMOUser> getAllPendingRegistration();

	public List<SMOUser> getAllUsers();
	
	public List<SMOUser> getUsersByRole(List<String> roles,int limit);
	
	public int getTotalCount();

}
