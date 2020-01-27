package com.bedrock2.surway.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bedrock2.surway.constants.Gender;
import com.bedrock2.surway.models.Question;
import com.bedrock2.surway.models.Response;
import com.bedrock2.surway.models.Survey;
import com.bedrock2.surway.models.User;
import com.bedrock2.surway.repository.QuestionRepository;
import com.bedrock2.surway.repository.ResponseRepository;
import com.bedrock2.surway.repository.SurveyRepository;
import com.bedrock2.surway.repository.UserRepository;

public class ResponseController {
	
	
	@Autowired
	private ResponseRepository responseRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private SurveyRepository surveyRepository;
	
	@Autowired
	private QuestionRepository questionRepository;
	
	
	@PostMapping(value = "/regResponse")
	public @ResponseBody String registerResponse(@RequestParam("userId") int userId,
			@RequestParam("optionNo") int optionNo, @RequestParam("questionId") int questionId,
			@RequestParam("surveyId") int surveyId) {

		User user = userRepository.findById(userId).get();

		if (user != null) {

			//create new response object
			//and save it in database
			Response response = new Response();
			response.setOptionNo(optionNo);
			response.setQuestionId(questionId);
			response.setSurveyId(surveyId);
			response.setUserId(userId);
			responseRepository.save(response);

			//get survey data from database
			Survey survey = surveyRepository.findById(surveyId).get();
			if(survey==null) return "Error: invalid survey id";

			//updating gender count
			//get gender of user
			Gender gender = user.getGender();
			//update corresponding response count
			switch (gender) {
				case MALE:
					survey.setMaleCount(survey.getMaleCount() + 1);
					break;
				case FEMALE:
					survey.setFemaleCount(survey.getFemaleCount() + 1);
					break;
				case OTHER:
					survey.setOtherCount(survey.getOtherCount() + 1);
					break;
				default:
					return "failed";
				}


			//updating question count in question table
			Question question = questionRepository.findById(questionId).get();
			question.incrementOptionCount(optionNo);
			questionRepository.save(question);
			
		
			//if all goes well save update survey data
			surveyRepository.save(survey);
			
		}

		//return "saved";
		return "/question?survey="+surveyId+"&q="+(questionId+1);

		// Question question =questionRepository.findById(questionId).get();
		// m.addAttribute("question", question);
		// return "/views/response.jsp";
	}
}
