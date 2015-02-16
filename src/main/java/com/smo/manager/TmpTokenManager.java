package com.smo.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smo.model.SMOTmpToken;
import com.smo.service.tmpToken.TmpTokenService;

@Component
public class TmpTokenManager {

	@Autowired
	TmpTokenService tmpTokenService;

	public void addTmpTokenForUser(SMOTmpToken userToken) {
		tmpTokenService.saveTmpToken(userToken);
	}

	public SMOTmpToken getTmpTokenForUser(String userId) {
		
		return tmpTokenService.getTmpTokenByUserId(userId);

	}

}
