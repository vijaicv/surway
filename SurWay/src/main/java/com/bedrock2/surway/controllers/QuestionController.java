package com.bedrock2.surway.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bedrock2.surway.models.Question;
import com.bedrock2.surway.models.Survey;
import com.bedrock2.surway.repository.QuestionRepository;
import com.bedrock2.surway.repository.SurveyRepository;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private SurveyRepository surveyRepository;
	
	
	@PostMapping("/addQuestion")
	public  String addQuestion(@RequestParam(value = "mandatory") boolean mandatory,
			@RequestParam(value = "question") String question, @RequestParam(value = "type") int type,
			@RequestParam(value = "surveyId") int surveyId, @RequestParam(value = "optionOne") String option1,
			@RequestParam(value = "optionTwo") String option2,
			@RequestParam(value= "optionThree") String option3,
			@RequestParam(value = "optionFour") String option4,
			@RequestParam(value = "optionFive") String option5,
			@RequestParam(value= "dropdownOptions") String dropdownOption){

		// save question
		System.out.println("mandatory: "+mandatory+
				" Question:"+question+
				" Type: "+type+
				" SurveyId: "+surveyId+
				" optionOne: "+option1+
				" optionTwo: "+option2+
				" optionThree: "+option3+
				" option4: "+option4+
				" option5: "+option5);
		String finalOption = null;
		if(type == 4)	
			finalOption = dropdownOption;
		else if(type == 1 || type == 2) {
			finalOption = option1+","+option2+","+option3+","+option4+","+option5;
		}
		System.out.println("Final Option : "+finalOption);
		
		
		
		Question q = new Question();
		q.setQuestionString(question);
		q.setType(type);
		q.setSurveyId(surveyId);
		q.setMandatory(mandatory);
		q.setOptions(finalOption);
		questionRepository.save(q);
//
//		// get current question count for survey
//		Survey survey = surveyRepository.findById(surveyId).get();
//		System.out.println(survey.getTitle());
//		int current = survey.getQuestionCount();
//		System.out.println(current + 1);
//
//		// increment question count
//		survey.setQuestionCount(current + 1);
//		surveyRepository.save(survey);
		return "/views/createsurvey.jsp";
	}
	
	
	@GetMapping(value = "/question")
	public String loadQuestion(@RequestParam(value = "survey") int surveyId, @RequestParam(value = "q") int questionNumber,
			Model m) {

		Survey survey = surveyRepository.findById(surveyId).get();
		m.addAttribute("surveyInfo", survey);

		Question question =questionRepository.findByQuestionNumber(questionNumber)	;
		m.addAttribute("question", question);
		return "/views/response.jsp";
	}
	
	
	
}
