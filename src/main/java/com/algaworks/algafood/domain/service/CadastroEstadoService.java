package com.algaworks.algafood.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.algaworks.algafood.domain.entity.Estado;
import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.repository.EstadoRepository;

@Service
public class CadastroEstadoService {

    public static final String MSG_ENTIDADE_NAO_ENCONTRADA = "Não existe estado com o código %d";
    public static final String MSG_ENTIDADE_EM_USO = "O estado de código %d não pode ser atualizado, pois está em uso";
    @Autowired
    private EstadoRepository estadoRepository;

    public Estado salvar(Estado estado) {
        try {
            return estadoRepository.save(estado);
        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(String.format(MSG_ENTIDADE_NAO_ENCONTRADA, estado.getId()));
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(String.format(MSG_ENTIDADE_EM_USO, estado.getId()));
        }

    }

    public void deletar(Long id) {
        try {
            Estado estado = estadoRepository.findById(id).orElse(null);
            estadoRepository.delete(estado);
        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(String.format(MSG_ENTIDADE_NAO_ENCONTRADA, id));
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(String.format(MSG_ENTIDADE_EM_USO, id));
        }
    }

    public Estado buscarOuFalhar(Long id) {
        return estadoRepository.findById(id).orElseThrow(() -> new EntidadeNaoEncontradaException
                (String.format(MSG_ENTIDADE_NAO_ENCONTRADA, id)));
    }
}
