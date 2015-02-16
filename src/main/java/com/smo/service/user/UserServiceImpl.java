package com.smo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.smo.model.SMOUser;
import com.smo.repository.BlogCustomQuery;
import com.smo.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	/**
	 * 
	 */
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private BlogCustomQuery blogCustomQuery;
	public SMOUser getUserByUserName(String userName) {
		List<SMOUser> user = userRepository.findByUsername(userName);
		if (user != null && user.size() > 0) {
			return user.get(0);
		} else {
			return null;
		}
	}

	public boolean addUser(SMOUser user) {

		// duplicate userName
		if (getUserByUserName(user.getUsername()) != null) {
			return false;
		}
		userRepository.save(user);
		return true;
	}

	@Override
	public boolean updateUser(SMOUser user) {
		Assert.notNull(user);
		Assert.notNull(user.getId());
		userRepository.save(user);
		return true;
	}

	@Override
	public List<SMOUser> getAllPendingRegistration() {
		return userRepository.findByRegisterationApproved(false);
	}

	@Override
	public List<SMOUser> getAllUsers() {
		
		return userRepository.findAll();
	}

	@Override
	public int getTotalCount() {
		return userRepository.findAll().size();
	}

	@Override
	public List<SMOUser> getUsersByRole(List<String> roles, int limit) {
		// TODO Auto-generated method stub
		
		return blogCustomQuery.getUsersByRoles(roles, limit);
	}

}
