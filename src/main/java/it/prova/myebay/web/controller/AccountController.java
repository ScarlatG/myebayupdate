package it.prova.myebay.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import it.prova.myebay.dto.PasswordDTO;
import it.prova.myebay.dto.RuoloDTO;
import it.prova.myebay.model.Utente;
import it.prova.myebay.service.UtenteService;
import it.prova.myebay.validation.ValidationNoPassword;
import it.prova.myebay.validation.ValidationWithPassword;


@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UtenteService utenteService;
	
	@GetMapping("/editPassword")
	public String editPassword(Model model, HttpServletRequest request, HttpServletResponse response){
		model.addAttribute("change_password_utente_attr", new PasswordDTO());
		return "utente/editPassword";
	}
	
	@PostMapping("/updatePassword")
	public String updatePassword(
			@Validated({ValidationWithPassword.class}) @ModelAttribute("change_password_utente_attr") PasswordDTO passwordDTO,
			BindingResult result, 
			Model model, 
			RedirectAttributes redirectAttrs) {
		
		UserDetails principal = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Utente utenteInSessione = utenteService.findByUsername(principal.getUsername());
		
		
		if (!result.hasFieldErrors("password") && !passwordDTO.getPassword().equals(passwordDTO.getConfermaPassword()))
			result.rejectValue("confermaPassword", "password.diverse");
		
		if(!passwordEncoder.matches(passwordDTO.getVecchiaPassword(), utenteInSessione.getPassword())) {
			result.rejectValue("vecchiaPassword", "password.old.error");
		}

		if (result.hasErrors()) {
			model.addAttribute("change_password_utente_attr", new PasswordDTO());
			return "utente/editPassword";
		}
		
		utenteService.changePassword(passwordDTO,utenteInSessione);

		return "redirect:/executeLogout";
	}

}
