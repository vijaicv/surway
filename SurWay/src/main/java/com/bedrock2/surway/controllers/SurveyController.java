package com.bedrock2.surway.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bedrock2.surway.models.Survey;
import com.bedrock2.surway.repository.QuestionRepository;
import com.bedrock2.surway.repository.ResponseRepository;
import com.bedrock2.surway.repository.SurveyRepository;
import com.bedrock2.surway.repository.UserRepository;

@Controller
public class SurveyController {
	
	@Autowired
	private SurveyRepository surveyRepository;
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private ResponseRepository responseRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	
	@PostMapping("/create")
	public @ResponseBody String createSurvey(HttpServletRequest request) {
		String title= (String) request.getParameter("title");
		String description= (String) request.getParameter("description");
		Survey s = new Survey();
	    s.setTitle(title);
	    s.setDescription(description);
	    surveyRepository.save(s);
		return "created";
	}

}
