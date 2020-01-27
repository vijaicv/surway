package com.bedrock2.surway.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bedrock2.surway.models.Question;
import com.bedrock2.surway.models.Survey;
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
	
	
	@GetMapping("/view/{id}")
	public String getSurvey(@PathVariable("id")int surveyId, Model m) {
		
		Survey survey = surveyRepository.findById(surveyId).get();
		m.addAttribute("surveyInfo",survey);
		
		Question[] questions = questionRepository.findBysurveyId(surveyId);
		m.addAttribute("questions",questions);
		
		return "/views/viewsurvey.jsp";
	}

}
