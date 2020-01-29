package com.bedrock2.surway.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bedrock2.surway.models.Question;
import com.bedrock2.surway.models.Survey;

public interface SurveyRepository extends JpaRepository<Survey, Integer>{
	
	List<Survey> findByauthorId(int authorId);
	List<Survey> findByAuthorIdAndPublished(int authorId, Boolean published);
 }
