package com.bedrock2.surway.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bedrock2.surway.repository.SurveyRepository;
import com.bedrock2.surway.models.Survey;

@Controller
public class SurveyController {
	
	@Autowired
	private SurveyRepository surveyRepository;
	
	
	@PostMapping("/create")
	public @ResponseBody String createSurvey(HttpServletRequest request) {
		String title= (String) request.getAttribute("title");
		String description= (String) request.getAttribute("description");
		Survey s = new Survey();
	    s.setTitle(title);
	    s.setDescription(description);
	    surveyRepository.save(s);
		return "created";
	}
	
}
