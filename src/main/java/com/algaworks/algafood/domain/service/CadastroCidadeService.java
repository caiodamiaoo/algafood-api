package com.algaworks.algafood.domain.service;

import com.algaworks.algafood.domain.entity.Cozinha;
import com.algaworks.algafood.domain.entity.Estado;
import com.algaworks.algafood.domain.exception.CidadeNaoEncontradoException;
import com.algaworks.algafood.domain.exception.EstadoNaoEncontradoException;
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

    public static final String MSG_ENTIDADE_NAO_ENCONTRADA = "Não existe cidade com o código %d";
    public static final String MSG_ENTIDADE_EM_USO = "A cidade de código %d não pode ser removido, pois está em uso";
    @Autowired
    private CidadeRepository cidadeRepository;

    @Autowired
    private CadastroEstadoService cadastroEstadoService;
    public Cidade salvar(Cidade cidade) {
        try {
            Long estadoId = cidade.getEstado().getId();
            Estado estadoNovo = cadastroEstadoService.buscarOuFalhar(estadoId);
            cidade.setEstado(estadoNovo);
            return cidadeRepository.save(cidade);
        } catch (EmptyResultDataAccessException e) {
            throw new EstadoNaoEncontradoException(cidade.getEstado().getId());
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(String.format("A cidade não pode ser criada, pois o Estado de código %d não existe", cidade.getEstado().getId()));
        }

    }

    public void deletar(Long id) {
        try {
            Cidade cidade = cidadeRepository.findById(id).orElseThrow(() -> new EmptyResultDataAccessException(1));
            cidadeRepository.delete(cidade);
        } catch (EmptyResultDataAccessException e) {
            throw new CidadeNaoEncontradoException(id);
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(String.format(MSG_ENTIDADE_EM_USO, id));
        }
    }

    public Cidade buscarOuFalhar(Long id) {
        return cidadeRepository.findById(id).orElseThrow(() -> new CidadeNaoEncontradoException(id));
    }
}
