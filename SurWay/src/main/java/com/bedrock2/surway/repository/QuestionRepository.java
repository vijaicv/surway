package com.bedrock2.surway.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bedrock2.surway.models.Question;

public interface QuestionRepository extends JpaRepository<Question, Integer>{
	Question[] findBySurveyId(int surveyId);
	Question findByQuestionNumberAndSurveyId(int questionNumber,int surveyId);
}
