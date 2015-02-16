package com.smo.service.tmpToken;

import com.smo.model.SMOTmpToken;

public interface TmpTokenService {

	public void saveTmpToken(SMOTmpToken token);
	
	public SMOTmpToken getTmpTokenByUserId(String userId);

}
