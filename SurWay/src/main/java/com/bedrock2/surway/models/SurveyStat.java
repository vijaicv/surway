package com.bedrock2.surway.models;
import java.util.Map;

public class SurveyStat{
    int surveyId,
        totalResponses,
        maleCount,
        femaleCount,
        otherCount;
    Map<Integer,Integer> ageCount;

    public SurveyStat(int surveyId, int totalResponses, int maleCount, int femaleCount, int otherCount,
            Map<Integer, Integer> ageCount) {
        this.surveyId = surveyId;
        this.totalResponses = totalResponses;
        this.maleCount = maleCount;
        this.femaleCount = femaleCount;
        this.otherCount = otherCount;
        this.ageCount = ageCount;
    }

    public int getTotalResponses() {
        return totalResponses;
    }

	public int getSurveyId() {
		return surveyId;
	}

	public int getMaleCount() {
		return maleCount;
	}

	public int getFemaleCount() {
		return femaleCount;
	}

	public int getOtherCount() {
		return otherCount;
	}

	public Map<Integer, Integer> getAgeCount() {
		return ageCount;
	}

    

    
    
}