package com.bedrock2.surway.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bedrock2.surway.models.Question;
import com.bedrock2.surway.models.Survey;
import com.bedrock2.surway.repository.QuestionRepository;
import com.bedrock2.surway.repository.SurveyRepository;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private SurveyRepository surveyRepository;
	
	
	@PostMapping("/addQuestion")
	public  String addQuestion(@RequestParam(value = "mandatory", required = false) boolean mandatory,
			@RequestParam(value = "question") String question, @RequestParam(value = "type") int type,
			@RequestParam(value = "surveyId") int surveyId, @RequestParam(value = "optionOne",required=false) String option1,
			@RequestParam(value = "optionTwo",required=false) String option2,
			@RequestParam(value= "optionThree" ,required=false) String option3,
			@RequestParam(value = "optionFour" , required=false) String option4,
			@RequestParam(value = "optionFive", required=false) String option5,
			@RequestParam(value= "dropdownOptions", required=false) String dropdownOption,
			@RequestParam(value= "questionNumber") int qNum,
			Model m){

		// save question

		System.out.println("mandatory: "+mandatory+
				" Question:"+question+
				" Type: "+type+
				" SurveyId: "+surveyId+
				" optionOne: "+option1+
				" optionTwo: "+option2+
				" optionThree: "+option3+
				" option4: "+option4+
				" option5: "+option5+
				" questionNumber: "+qNum);
		String[] options = new String[]{option1,option2,option3,option4,option5};
		
		String finalOption = option1+","+option2;
		if(type == 4)	
			finalOption = dropdownOption;
		else if(type == 1 || type == 2) {
			for(int i= 2; i < 5; ++i) {
				System.out.println("String : "+options[i]);
				if(options[i] != null) {
					finalOption= finalOption+","+options[i];
				}
				else {
					continue;
				}
			}
//			finalOption = option1+","+option2+","+option3+","+option4+","+option5;
		}
		System.out.println("Final Option : "+finalOption);
		
		
		
		Question q = new Question();
		q.setQuestionString(question);
		q.setType(type);
		q.setSurveyId(surveyId);
		q.setMandatory(mandatory);
		q.setOptions(finalOption);
		q.setQuestionNumber(qNum);
		questionRepository.save(q);

		m.addAttribute("qNum",(++qNum));
		
		Survey survey = surveyRepository.findById(surveyId).get();
		m.addAttribute("survey", survey);
		System.out.println(survey.getTitle());
		int current = survey.getQuestionCount();
		System.out.println(current + 1);

		survey.setQuestionCount(current + 1);
		surveyRepository.save(survey);
		return "/views/createsurvey.jsp";
	}
	
	
	@GetMapping(value = "/view")
	public String loadQuestion(@RequestParam(value = "survey") int surveyId, @RequestParam(value = "q") int questionNumber,
			Model m) {

		Survey survey = surveyRepository.findById(surveyId).get();
		m.addAttribute("surveyInfo", survey);

		Question question =questionRepository.findByQuestionNumberAndSurveyId(questionNumber,surveyId)	;
		m.addAttribute("question", question);
		return "/views/response.jsp";
	}
	
	
	@PostMapping("/update")
	public String updateQuestion(
			@RequestParam("questionId") int questionId,
			@RequestParam(value = "mandatory",required=false) boolean mandatory,
			@RequestParam(value = "question") String question,
			@RequestParam(value = "type") int type,
			@RequestParam(value = "surveyId") int surveyId, 
			@RequestParam(value = "optionOne",required=false) String option1,
			@RequestParam(value = "optionTwo",required=false) String option2,
			@RequestParam(value= "optionThree" ,required=false) String option3,
			@RequestParam(value = "optionFour" , required=false) String option4,
			@RequestParam(value = "optionFive", required=false) String option5,
			@RequestParam(value= "dropdownOptions", required=false) String dropdownOption,
			Model m) {
		
		System.out.println("mandatory: "+mandatory+
				" Question:"+question+
				" Type: "+type+
				" SurveyId: "+surveyId+
				" optionOne: "+option1+
				" optionTwo: "+option2+
				" optionThree: "+option3+
				" option4: "+option4+
				" option5: "+option5);
		
String[] options = new String[]{option1,option2,option3,option4,option5};
		
		String finalOption = option1+","+option2;
		if(type == 4)	
			finalOption = dropdownOption;
		else if(type == 1 || type == 2) {
			for(int i= 2; i < 5; ++i) {
				System.out.println("String : "+options[i]);
				if(options[i] != null) {
					finalOption= finalOption+","+options[i];
				}
				else {
					continue;
				}
			}
		}
		System.out.println("Final Option : "+finalOption+questionId);
	
		Question q = questionRepository.findById(questionId).get();
		q.setQuestionString(question);
		q.setType(type);
		q.setMandatory(mandatory);
		q.setOptions(finalOption);
		questionRepository.save(q);
		Survey survey = surveyRepository.findById(surveyId).get();
		m.addAttribute("survey", survey);
		return "/views/survey_completed.jsp";
		
	}
	
}
