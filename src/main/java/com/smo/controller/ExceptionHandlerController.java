package com.smo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionHandlerController {

	@RequestMapping("/404")
	public String handleResourceNotFoundException() {

		return "page-404";
	}

}
