package it.prova.myebay.dto;

import javax.validation.constraints.NotBlank;

import it.prova.myebay.validation.ValidationWithPassword;

public class PasswordDTO {
	
	@NotBlank(message = "{password.old.notblank}", groups = ValidationWithPassword.class)
	private String vecchiaPassword;
	@NotBlank(message = "{password.new.notblank}", groups = ValidationWithPassword.class)
	private String password;
	@NotBlank(message = "{password.confirm.notblank}", groups = ValidationWithPassword.class)
	private String confermaPassword;
	
	public String getVecchiaPassword() {
		return vecchiaPassword;
	}
	public void setVecchiaPassword(String vecchiaPassword) {
		this.vecchiaPassword = vecchiaPassword;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfermaPassword() {
		return confermaPassword;
	}
	public void setConfermaPassword(String confermaPassword) {
		this.confermaPassword = confermaPassword;
	}
	
	

}
