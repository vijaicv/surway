package com.bedrock2.surway.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

@Controller
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
	public String registerResponse(@RequestParam("userId") int userId,
			@RequestParam("optionNo") int optionNo, @RequestParam("questionId") int questionId,
			@RequestParam("surveyId") int surveyId,Model m) {

		//create new response object
		//and save it in database
		Response response = new Response();
		response.setOptionNo(optionNo);
		response.setQuestionId(questionId);
		response.setSurveyId(surveyId);
		response.setUserId(userId);
		responseRepository.save(response);

		//TODO: avoid fetching survey details everytime if possible
		Survey surveym = surveyRepository.findById(surveyId).get();
		m.addAttribute("surveyInfo", surveym);

		Question questionnum=questionRepository.findByQuestionNumber(questionId+1);
		//int questionnm=question_Id.getQuestionNumber();
		m.addAttribute("question",questionnum);
		System.out.println(" surveyId in REsponseController"+surveyId+"\n quesyionnumber in regresponse"+questionId+1);
		return "/views/response.jsp";
		//return "saved";
		//return "/question?survey="+surveyId+"&q="+(questionId+1);

		// Question question =questionRepository.findById(questionId).get();
		// m.addAttribute("question", question);
		// return "/views/response.jsp";
	}
	
	@RequestMapping(value = "/survey_completed")
	public String Completed()
	{
		return "/views/survey_completed.jsp";
	}
	
}
