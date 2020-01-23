package com.bedrock2.surway.controllers;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bedrock2.surway.repository.QuestionRepository;
import com.bedrock2.surway.repository.ResponseRepository;
import com.bedrock2.surway.repository.SurveyRepository;
import com.bedrock2.surway.repository.UserRepository;
import com.bedrock2.surway.models.Question;
import com.bedrock2.surway.models.Survey;
import com.bedrock2.surway.models.User;
import com.bedrock2.surway.models.Response;
import com.bedrock2.surway.models.User;
import com.bedrock2.surway.constants.Gender;

@Controller
public class SurveyController {

	@Autowired
	private SurveyRepository surveyRepository;

	@Autowired
	private QuestionRepository questionRepository;

	@Autowired
	private ResponseRepository responseRepository;

	@Autowired
	private UserRepository UserRepository;

	@Autowired
	private UserRepository userRepository;

	@PostMapping("/create")
	public @ResponseBody String createSurvey(HttpServletRequest request) {
		String title = (String) request.getParameter("title");
		String description = (String) request.getParameter("description");
		Survey s = new Survey();
		s.setTitle(title);
		s.setDescription(description);
		surveyRepository.save(s);
		return "created";
	}

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

		return "saved";

	}


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
