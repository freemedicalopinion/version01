package com.smo.utility;

import java.io.IOException;
import java.security.GeneralSecurityException;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;

import com.smo.constant.AppConstants;

/**
 * This class is used to decrypt the data using PluginConstant.CRYPTO_ALOGORITHM
 * algo.
 * */
public class Decryption {
	private Cipher cipher;

	public Decryption() {

		try {
			/**
			 * building the Cipher object that will be responsible of doing the
			 * decryption.
			 * */
			cipher = Cipher.getInstance(AppConstants.CRYPTO_ALOGORITHM);
		} catch (Exception e) {
		}
	}

	public String decryption(String encryptedData)
			throws GeneralSecurityException, IOException {
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] raw = decoder.decodeBuffer(encryptedData);
		return decrypt(raw);
	}

	private String decrypt(byte[] encrypted) throws GeneralSecurityException {

		byte[] raw = AppConstants.CRYPTO_KEY.getBytes();
		if (raw.length != 16) {
			throw new IllegalArgumentException("Invalid key size.");
		}
		SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
		cipher.init(Cipher.DECRYPT_MODE, skeySpec);
		byte[] original = cipher.doFinal(encrypted);

		return new String(original);

	}

}
