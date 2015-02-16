package com.smo.utility;

import java.util.Date;
import java.util.Random;

public class CodeGenerator {

	public static String getEmailVerificationCode() {
		Date d = new Date();
		long time = d.getTime();
		int randomInt = randInt(7, 10);
		String emailVerificationCode = time + "_" + randomInt;
		return emailVerificationCode;
	}

	public static String getRandomPassword() {
		int randomInt = randInt(10, 15);
		return String.valueOf(randomInt);
	}
	
	public static String getForgotPasswordCode() {
		int randomInt = randInt(17, 30);
		return String.valueOf(randomInt);
	}
	public static String getTmpCodeForForgotPassword(){
		int randomInt = randInt(13, 17);
		return String.valueOf(randomInt);
	}
	public static String getTmpCodeForChangePassword(){
		int randomInt = randInt(13, 17);
		return String.valueOf(randomInt);
	}

	/**
	 * Returns a pseudo-random number between min and max, inclusive. The
	 * difference between min and max can be at most
	 * <code>Integer.MAX_VALUE - 1</code>.
	 * 
	 * @param min
	 *            Minimum value
	 * @param max
	 *            Maximum value. Must be greater than min.
	 * @return Integer between min and max, inclusive.
	 * @see java.util.Random#nextInt(int)
	 */
	public static int randInt(int min, int max) {

		// NOTE: Usually this should be a field rather than a method
		// variable so that it is not re-seeded every call.
		Random rand = new Random();

		// nextInt is normally exclusive of the top value,
		// so add 1 to make it inclusive
		int randomNum = rand.nextInt((max - min) + 1) + min;

		return randomNum;
	}
}
