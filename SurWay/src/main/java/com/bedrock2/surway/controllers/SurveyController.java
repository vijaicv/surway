package com.bedrock2.surway.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bedrock2.surway.models.Question;
import com.bedrock2.surway.models.Response;
import com.bedrock2.surway.models.Survey;
import com.bedrock2.surway.models.User;
import com.bedrock2.surway.repository.QuestionRepository;
import com.bedrock2.surway.repository.ResponseRepository;
import com.bedrock2.surway.repository.SurveyRepository;
import com.bedrock2.surway.repository.UserRepository;

@Controller
@RequestMapping("/survey")
public class SurveyController {

	@Autowired
	private SurveyRepository surveyRepository;

	@Autowired
	private QuestionRepository questionRepository;

	@Autowired
	private ResponseRepository responseRepository;

	@Autowired
	private UserRepository userRepository;


	@GetMapping("/createnew")
	public String loadCreatePage() {
		return "/views/createnew.jsp";
	}


	@PostMapping("/create")
	public String createSurvey(HttpServletRequest request, Model m) {
		String title= (String) request.getParameter("title");
		String description= (String) request.getParameter("description");
		int authorId = (int) Integer.parseInt(request.getParameter("authorId"));
		Survey s = new Survey();
		s.setTitle(title);
		s.setDescription(description);
		s.setAuthorId(authorId);
		surveyRepository.save(s);
		m.addAttribute("survey",s);
		m.addAttribute("qNum",1);
		return "/views/createsurvey.jsp";
	}

	@PostMapping("/delete")
	public String deleteSurvey(@RequestParam("surveyId") int surveyId) {
		Survey survey = surveyRepository.findById(surveyId).get();
		surveyRepository.delete(survey);
		return "/views/survey_deleted.jsp";
	}


	@GetMapping("/view")
	public String getSurvey(@RequestParam("id")int surveyId, Model m) {

		Survey survey = surveyRepository.findById(surveyId).get();
		m.addAttribute("surveyInfo",survey);

		Question[] questions = questionRepository.findBySurveyId(surveyId);
		m.addAttribute("questions",questions);

		return "/views/viewsurvey.jsp";
	}


	@PostMapping("/edit")
	public String loadEditPage(@RequestParam("surveyId")int surveyId,@RequestParam("questionId")int questionId,Model m) {
		Survey survey = surveyRepository.findById(surveyId).get();
		m.addAttribute("surveyInfo",survey);

		Question question = questionRepository.findById(questionId).get();
		m.addAttribute("question",question);
		return "/views/editsurvey.jsp";
	}


	@PostMapping("/publish")
	public String publishSurvey(@RequestParam("surveyId") int surveyId,Model m) {
		m.addAttribute("surveyId",surveyId);
		Survey survey = surveyRepository.findById(surveyId).get();
		survey.setPublished(true);
		surveyRepository.save(survey);
		return "/views/survey_published.jsp";
	}



	@PostMapping("/submit")
	public String submitSurvey(
			@RequestParam("surveyId")int surveyId,
			@RequestParam("userId")int userId,
			Model m) {
		User user = userRepository.findById(userId).get();
		Survey survey = surveyRepository.findById(surveyId).get();
		List<Response> responses =responseRepository.findByUserIdAndSurveyId(userId,surveyId);
		
		
		
		switch (user.getGender()) {
		case MALE:
			survey.setMaleCount(survey.getMaleCount()+1);
			break;
		case FEMALE:
			survey.setFemaleCount(survey.getFemaleCount()+1);
		case OTHER:
			survey.setOtherCount(survey.getOtherCount()+1);
		default:
			break;
		}
		
		for(Response resp: responses) {
			Question question = questionRepository.findById(resp.getQuestionId()).get();
			int type=question.getType();
			if(type==2) {
				for(String selectedOption:resp.getOptionNo().split(",")) {
					question.incrementOptionCount(Integer.parseInt(selectedOption));
				}
			}
			else if(type==3) {
				String current = question.getOptionCount();
				current=current+resp.getOptionNo();
				question.setOptionCount(current);
			}
			else if(type==1||type==4) {
				question.incrementOptionCount(Integer.parseInt(resp.getOptionNo()));
			}
			
			questionRepository.save(question);
		}
		
		
		
		return "/views/survey_completed";
	}



}
