package com.bedrock2.surway.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Id;
@Entity
@Table(name="question")
public class Question {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int Id;
	
	String question;
	
	int type;
	
	int surveyId;
	
	Boolean mandatory;
	
	String options;

	String optionCount;


	


	public Boolean getMandatory() {
		return mandatory;
	}

	public void setMandatory(Boolean mandatory) {
		this.mandatory = mandatory;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getSurveyId() {
		return surveyId;
	}

	public void setSurveyId(int surveyId) {
		this.surveyId = surveyId;
	}

	public String getOptionCount() {
		return optionCount;
	}

	public void setOptionCount(String optionCount) {
		this.optionCount = optionCount;
	}

	//method to parse string and get actual option count
	public int getIntOptionCount(int optionNumber){
		String[] counts = optionCount.split(",");
		return Integer.parseInt(counts[optionNumber]);
	}


	public void incrementOptionCount(int optionNumber){
		String[] counts = optionCount.split(",");
		int currentCount = Integer.parseInt(counts[optionNumber]);
		counts[optionNumber]=Integer.toString(currentCount+1);
		optionCount = String.join(",", counts);
	}

	
	
	
}
