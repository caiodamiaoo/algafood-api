package com.algaworks.algafood.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.algaworks.algafood.domain.entity.Cozinha;
import com.algaworks.algafood.domain.entity.Restaurante;
import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.repository.CozinhaRepository;
import com.algaworks.algafood.domain.repository.RestauranteRepository;
import org.springframework.web.bind.annotation.PostMapping;

@Service
public class CadastroRestauranteService {

	@Autowired
	private RestauranteRepository restauranteRepository;

	@Autowired
	private CozinhaRepository cozinhaRepository;

	public Restaurante salvar(Restaurante restaurante) {
		Long cozinhaId = restaurante.getCozinha().getId();
		Cozinha cozinha = cozinhaRepository.findById(cozinhaId).orElse(null);
		if (cozinha == null) {
			throw new EntidadeNaoEncontradaException(String.format("Não existe cadastro com código %d", cozinhaId));
		}
		restaurante.setCozinha(cozinha);

		return restauranteRepository.save(restaurante);
	}

	public Restaurante atualizar(Long id, Restaurante restaurante) {
		try {
			Restaurante restauranteAtual = restauranteRepository.findById(id).orElse(null);
			restauranteAtual.setCozinha(restaurante.getCozinha());
			restauranteAtual.setNome(restaurante.getNome());
			restauranteAtual.setTaxaFrete(restaurante.getTaxaFrete());
			return restauranteRepository.save(restauranteAtual);
		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException(
					String.format("Não existe um cadastro de restaurante com código %d", id));
		} catch(DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(String.format("Não existe um cadastro de cozinha com código %d", restaurante.getCozinha().getId()));
		}
	}
	
	public void deletar(Long id) {
		try {
			restauranteRepository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException(String.format("Não existe um cadastro de restaurante com código %d",id));
		} catch(DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(String.format("O restaurante de código %d não pode ser removido, pois está em uso", id));
		}
	}
}
