package com.smo.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.smo.model.ContentImages;

public class ContentImageValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object uploadedFile, Errors errors) {

		ContentImages imgs = (ContentImages) uploadedFile;

		if (imgs.getBigImage().getSize() == 0) {
			errors.rejectValue("file", "uploadForm.salectFile",
					"Please select a file!");
		}
	}

}
