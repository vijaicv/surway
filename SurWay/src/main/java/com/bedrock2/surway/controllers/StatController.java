package com.bedrock2.surway.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bedrock2.surway.models.Question;
import com.bedrock2.surway.models.Survey;
import com.bedrock2.surway.repository.QuestionRepository;
import com.bedrock2.surway.repository.SurveyRepository;

@Controller
public class StatController {
	
	@Autowired
	private SurveyRepository surveyRepository;
	
	@Autowired
	private QuestionRepository questionRepository;
	
	
	@GetMapping(value = "/statistics")
	public String returnStatistics(@RequestParam(value = "survey") int surveyId, Model m) {
		System.out.println(surveyId );
		Survey survey = surveyRepository.findById(surveyId).get();
		m.addAttribute("surveyInfo", survey);
		
		return "/views/statistics.jsp";
	}
	
	@GetMapping(value = "/QStatistics")
	public String returnQStatistics(@RequestParam(value = "s") int surveyId, Model m) {
		Question[] questions = questionRepository.findBysurveyId(surveyId);
		Survey survey = surveyRepository.findById(surveyId).get();
		m.addAttribute("survey", survey);
		m.addAttribute("questions",questions);
		return "/views/q_statistics.jsp";
	}
}
