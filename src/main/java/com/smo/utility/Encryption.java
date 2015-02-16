package com.smo.utility;

import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Encoder;

import com.smo.constant.AppConstants;

/**
 * 128 bit encryption. This class is used to encrypt the data using
 * PluginConstant.CRYPTO_ALOGORITHM algo.
 * */
public class Encryption {

	private Cipher cipher;

	public Encryption() {
		try {
			/**
			 * building the Cipher object that will be responsible of doing the
			 * encryption.
			 * */
			cipher = Cipher.getInstance(AppConstants.CRYPTO_ALOGORITHM);
		} catch (Exception e) {
		}
	}

	/**
	 * public method which will take to plain text as input and return the
	 * encrypted ciphered text as output.
	 * */
	public String encryption(String data) throws GeneralSecurityException {
		return doubleEncrypt(data);

	}

	/**
	 * converting the encrypted message to a format that will be easy to read on
	 * screen
	 * */
	private String doubleEncrypt(String data) throws GeneralSecurityException {
		byte[] singleEncryptedData = encrypt(data);
		BASE64Encoder encoder = new BASE64Encoder();
		String encryptedData = encoder.encode(singleEncryptedData);
		return encryptedData;

	}

	/**
	 * converting the message into Cipher
	 * */
	private byte[] encrypt(String value) throws InvalidKeyException,
			IllegalBlockSizeException, BadPaddingException {

		byte[] raw = AppConstants.CRYPTO_KEY.getBytes();
		if (raw.length != 16) {
			throw new IllegalArgumentException("Invalid key size.");
		}

		SecretKeySpec skeySpec = new SecretKeySpec(raw,
				AppConstants.CRYPTO_ALOGORITHM);

		cipher.init(Cipher.ENCRYPT_MODE, skeySpec);

		return cipher.doFinal(value.getBytes());

	}

}
