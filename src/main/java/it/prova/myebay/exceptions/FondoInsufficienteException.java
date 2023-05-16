package it.prova.myebay.exceptions;

public class FondoInsufficienteException extends RuntimeException{
	
	public FondoInsufficienteException() {}
	
	public FondoInsufficienteException(String message) {
		super(message);
	}

}
