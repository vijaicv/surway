package com.bedrock2.surway.controllers;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.bedrock2.surway.models.Survey;
import com.bedrock2.surway.repository.SurveyRepository;

@Controller
@RequestMapping("/Dashboard")
public class DashController {
	
	@Autowired
	SurveyRepository surveyRepository;
	
	@GetMapping("/{id}")
	public String getDashboard(@PathVariable("id") int authorId, Model m) {
		
		List<Survey> drafts = surveyRepository.findByAuthorIdAndPublished(authorId,false);
		m.addAttribute("drafts",drafts);
		
		List<Survey> published = surveyRepository.findByAuthorIdAndPublished(authorId, true);
		m.addAttribute("published",published);
		
		return "/views/dashboard.jsp";
	}
	
}
