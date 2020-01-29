	package com.bedrock2.surway.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bedrock2.surway.constants.Gender;
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
		Question[] questions = questionRepository.findBySurveyId(surveyId);
		Survey survey = surveyRepository.findById(surveyId).get();
		m.addAttribute("survey", survey);
		m.addAttribute("questions",questions);
		return "/views/q_statistics.jsp";
	}
	
	
	
//	if (user != null) {
//
//		
//
//		//get survey data from database
//		Survey survey = surveyRepository.findById(surveyId).get();
//		if(survey==null) return "Error: invalid survey id";
//
//		//updating gender count
//		//get gender of user
//		Gender gender = user.getGender();
//		//update corresponding response count
//		switch (gender) {
//			case MALE:
//				survey.setMaleCount(survey.getMaleCount() + 1);
//				break;
//			case FEMALE:
//				survey.setFemaleCount(survey.getFemaleCount() + 1);
//				break;
//			case OTHER:
//				survey.setOtherCount(survey.getOtherCount() + 1);
//				break;
//			default:
//				return "failed";
//			}
//
//
//		//updating question count in question table
//		Question question = questionRepository.findById(questionId).get();
//		question.incrementOptionCount(optionNo);
//		questionRepository.save(question);
//		
//	
//		//if all goes well save update survey data
//		surveyRepository.save(survey);
}
