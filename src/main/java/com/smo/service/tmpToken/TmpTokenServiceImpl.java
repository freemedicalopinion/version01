package com.smo.service.tmpToken;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOTmpToken;
import com.smo.repository.TmpTokenRepository;

@Service
public class TmpTokenServiceImpl implements TmpTokenService {

	@Autowired
	TmpTokenRepository tmpTokenRepository;

	@Override
	public void saveTmpToken(SMOTmpToken token) {
		tmpTokenRepository.save(token);
	}

	@Override
	public SMOTmpToken getTmpTokenByUserId(String userId) {
		List<SMOTmpToken> tmpTokenForUser = tmpTokenRepository
				.findByUserId(userId);
		if(tmpTokenForUser!=null && tmpTokenForUser.size()>0){
			return tmpTokenForUser.get(0);
		}
		return null;
	}
}
