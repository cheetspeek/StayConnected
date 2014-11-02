package com.fastrax.stayconnected.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	/**
	 * Controller for home page
	 * @author Ben Degler
	 * @param failed	String to hold status of login
	 * @param model		Model object of jsp files
	 * @return Home		JSP of home page
	 */
	@RequestMapping(value = {"/home"}, method = RequestMethod.GET)
	public String login(@RequestParam(value="login_error", defaultValue="f") String failed, Model model) {
		if (failed.equalsIgnoreCase("t")) {
			model.addAttribute("error_message", "Incorrect username and/or password");
		}
		return "Home";
	}
}
