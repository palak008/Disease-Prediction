package com.palak.Login;

public class Disease {
	String disease_name;
	String disease_symptoms;
	String disease_treatments;
	String disease_parentDisease;
	String disease_riskFactors;
	
	public Disease(String disease_name, String disease_symptoms, String disease_treatments,
			String disease_parentDisease, String disease_riskFactors) {
		super();
		this.disease_name = disease_name;
		this.disease_symptoms = disease_symptoms;
		this.disease_treatments = disease_treatments;
		this.disease_parentDisease = disease_parentDisease;
		this.disease_riskFactors = disease_riskFactors;
	}
	@Override
	public String toString() {
	    return "Record :" + this.getDisease_name()+ 
	           ",  " + this.getDisease_symptoms()+ ",  " + this.getDisease_treatments()+ ",  " + this.getDisease_parentDisease()+ ",  " + this.getDisease_riskFactors();
	}
	
	public String getDisease_name() {
		return disease_name;
	}
	public void setDisease_name(String disease_name) {
		this.disease_name = disease_name;
	}
	public String getDisease_symptoms() {
		return disease_symptoms;
	}
	public void setDisease_symptoms(String disease_symptoms) {
		this.disease_symptoms = disease_symptoms;
	}
	public String getDisease_treatments() {
		return disease_treatments;
	}
	public void setDisease_treatments(String disease_treatments) {
		this.disease_treatments = disease_treatments;
	}
	public String getDisease_parentDisease() {
		return disease_parentDisease;
	}
	public void setDisease_parentDisease(String disease_parentDisease) {
		this.disease_parentDisease = disease_parentDisease;
	}
	public String getDisease_riskFactors() {
		return disease_riskFactors;
	}
	public void setDisease_riskFactors(String disease_riskFactors) {
		this.disease_riskFactors = disease_riskFactors;
	}
	

	
}
