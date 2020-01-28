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
	
	int questionNumber;
	
	String questionString;
	
	int type;
	
	int surveyId;
	
	Boolean mandatory;
	
	String options;

	String optionCount="0,0,0,0,0";


		
	public int getQuestionNumber() {
		return questionNumber;
	}

	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}

	public int getTotalResponses() {
		String[] counts = optionCount.split(",");
		int total=0;
		for(String optioncount:counts) {
			int count=Integer.parseInt(optioncount);
			total+=count;
		}
		return total;
	}

	public Boolean getMandatory() {
		return mandatory;
	}

	public void setMandatory(Boolean mandatory) {
		this.mandatory = mandatory;
	}

	public String[] getOptions() {
		return options.split(",");
	}
	
	public String getOptionsString() {
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

	public String getQuestionString() {
		return questionString;
	}

	public void setQuestionString(String questionString) {
		this.questionString = questionString;
	}

	
	
	
}
