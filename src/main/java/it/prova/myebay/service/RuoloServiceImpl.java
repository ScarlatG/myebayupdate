package it.prova.myebay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.prova.myebay.model.Ruolo;
import it.prova.myebay.repository.ruolo.RuoloRepository;

@Service
public class RuoloServiceImpl implements RuoloService{

	@Autowired
	private RuoloRepository repository;
	
	@Override
	@Transactional(readOnly = true)
	public List<Ruolo> listAll() {
		return (List<Ruolo>) repository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Ruolo caricaSingoloElemento(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void aggiorna(Ruolo ruoloInstance) {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public void inserisciNuovo(Ruolo ruoloInstance) {
		repository.save(ruoloInstance);
		
	}

	@Override
	@Transactional
	public void rimuovi(Long idToDelete) {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional(readOnly = true)
	public Ruolo cercaPerDescrizioneECodice(String descrizione, String codice) {
		return repository.findByDescrizioneAndCodice(descrizione, codice);
	}

	@Override
	public List<Ruolo> cercaRuoliByIds(Long[] ids) {
		return repository.findAllRuoliByIds(ids);
	}

}
