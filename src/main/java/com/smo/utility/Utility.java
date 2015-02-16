package com.smo.utility;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.smo.constant.AppConstants;

public class Utility {
	public static List<String> changeListToCommaSeprated(List<String> list) {
		String commaSprated = "";
		List<String> returnList = new ArrayList<String>();
		if (list != null && list.size() != 0) {
			for (String value : list) {
				commaSprated += "," + value;
			}
			if (commaSprated != "") {
				returnList.add(commaSprated.replaceFirst(",", ""));
				return returnList;
			} else
				return null;
		}

		return null;
	}

	public static boolean matchPassword(String password1, String password2) {
		Decryption d = new Decryption();
		String password1Decrypted = null;
		try {
			password1Decrypted = d.decryption(password1);
		} catch (GeneralSecurityException e) {
			return false;
		} catch (IOException e) {
			return false;
		}
		if (password1Decrypted.equals(password2)) {
			return true;
		}

		return false;
	}

	public static String saveFile(MultipartFile file, String type, String contentId)
			throws IOException {
		InputStream inputStream = null;
		OutputStream outputStream = null;
		String name = null;
		if (file != null && file.getSize() != 0) {
			String fileName = file.getOriginalFilename();
			try {
				inputStream = file.getInputStream();
				new File(AppConstants.FILE_STORE_LOCATION
						+ contentId.replace(" ", "") + "\\" + type).mkdirs();

				File saveFile = new File(AppConstants.FILE_STORE_LOCATION
						+ contentId.replace(" ", "") + "\\" + type + "\\"
						+ fileName);
				if (!saveFile.exists()) {
					saveFile.createNewFile();
				}
				outputStream = new FileOutputStream(saveFile);
				int read = 0;
				byte[] bytes = new byte[1024];

				while ((read = inputStream.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
				name = saveFile.getName();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				outputStream.close();
				inputStream.close();
			}

		}
		return name;

	}
	
	
}
