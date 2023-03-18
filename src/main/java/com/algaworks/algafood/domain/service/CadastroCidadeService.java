package com.algaworks.algafood.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.algaworks.algafood.domain.entity.Cidade;
import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.repository.CidadeRepository;

@Service
public class CadastroCidadeService {
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	public Cidade salvar(Cidade cidade) {
		try {
			return cidadeRepository.save(cidade);
		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException(String.format("Não existe cidade com o código %d", cidade.getId()));
		} catch (DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(String.format("A cidade não pode ser criada, pois o Estado de código %d não existe", cidade.getEstado().getId()));
		}
		
	}
	
	public void deletar(Long id) {
		try {
			Cidade cidade = cidadeRepository.findById(id).orElseThrow(() -> new EmptyResultDataAccessException(1));
			cidadeRepository.delete(cidade);
		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException(String.format("Não existe cidade com o código %d", id));
		} catch (DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(String.format("O cidade de código %d não pode ser removido, pois está em uso ", id));
		}
	}
}
