package com.bedrock2.surway.repository;
import com.bedrock2.surway.models.Response;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ResponseRepository extends JpaRepository<Response,Integer>{
	List<Response> findByUserIdAndSurveyId(int userId, int surveyId);
}