package com.bedrock2.surway.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

//Survey model class
import com.bedrock2.surway.models.Survey;
import com.bedrock2.surway.models.SurveyStat;


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
		return "/views/home.jsp";
	}
	
	
//	---------------------------------------
//	move following mappings to respective controllers
	
	@GetMapping("/login")
	public String loadLogin() {
		return "/views/loginSignup.jsp";
	}
	
	
	@GetMapping("/response")
	public String loadSurvey(Model m) {


		//fake data for temporary use replace with actual data from database
		String[] options = new String[]{
			"this is option 1",
			"this is option 2",
			"this is option 3",
			"this is option 4",
			"this is option 5",
		};
		m.addAttribute("type", "attributeValue");
		m.addAttribute("question", "this is the question that is to be displayed");
		//--------------------------------------


		m.addAttribute("options", options);
		return "/views/response.jsp";
	}
	
	
	
	
	
	
	// @GetMapping("/statistics")
	// public String loadStatistics(Model m) {

	// 	//fake data for temporary use
	// 	Survey survey = new Survey(
	// 		"Employee feedback survey",
	// 		"a survey to collect employee feedback",
	// 		20);

	// 	//------------fake data
	// 	Map<Integer,Integer> ageWiseCount= new HashMap<Integer,Integer>();
	// 	ageWiseCount.put(20, 15);
	// 	ageWiseCount.put(30, 12);
	// 	ageWiseCount.put(40, 30);
	// 	ageWiseCount.put(50, 10);
		
	// 	SurveyStat surveyStat= new SurveyStat(
	// 		123,
	// 		200,
	// 		120,
	// 		60,
	// 		20,
	// 		ageWiseCount
	// 	);
	// 	m.addAttribute("survey", survey);
	// 	m.addAttribute("stats", surveyStat);
	// 	return "/views/statistics.jsp";
	// }

	
	
	
	
//	-----------------------------------------------------------
	
}
