package com.bedrock2.surway;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


/**
 * 
 * @author vijaicv
 *	controller for home page mappings
 *	
 *	move other mappings to respective controllers when created
 */
@Controller
public class HomeController {
	
	@GetMapping("/")
	public String loadHome() {
		return "/pages/home.jsp";
	}
	
	
//	---------------------------------------
//	move following mappings to respective controllers
	
	@GetMapping("/login")
	public String loadLogin() {
		return "/pages/loginSignup.jsp";
	}
	
	@GetMapping("/dashboard")
	public String loadDash() {
		return "/pages/dashboard.jsp";
	}
	
	@GetMapping("/survey")
	public String loadSurvey() {
		return "/pages/survey.jsp";
	}
	
	@GetMapping("/create")
	public String loadCreatePage() {
		return "/pages/createsurvey.jsp";
	}
	
	
	@GetMapping("/statistics")
	public String loadStatistics() {
		return "/pages/statistics.jsp";
	}
	
	
	
//	-----------------------------------------------------------
	
}
