package com.algaworks.algafood.api.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.algaworks.algafood.domain.entity.Cozinha;
import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.repository.CozinhaRepository;
import com.algaworks.algafood.domain.service.CadastroCozinhaService;

@RestController
@RequestMapping(value = "/cozinhas", produces = "application/json")
public class CozinhaController {

    @Autowired
    private CozinhaRepository cozinhaRepository;

    @Autowired
    private CadastroCozinhaService cadastroCozinhaService;

    @GetMapping
    public List<Cozinha> listar() {

        return cozinhaRepository.findAll();
    }

    @GetMapping("/{id}")
    public Cozinha buscar(@PathVariable Long id) {

        return cadastroCozinhaService.buscarOuFalhar(id);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping
    public Cozinha incluir(@RequestBody Cozinha cozinha) {

        return cadastroCozinhaService.salvar(cozinha);
    }

    @PutMapping("/{id}")
    public Cozinha atualizar(@PathVariable Long id, @RequestBody Cozinha cozinha) {

        Cozinha cozinhaNova = cadastroCozinhaService.buscarOuFalhar(id);
        BeanUtils.copyProperties(cozinha, cozinhaNova, "id");
        return cadastroCozinhaService.salvar(cozinhaNova);
    }

//	@DeleteMapping("/{id}")
//	public ResponseEntity<Void> deletar(@PathVariable Long id) {
//		try {
//			cadastroCozinhaService.deletar(id);
//			return ResponseEntity.noContent().build();
//
//		} catch (EntidadeNaoEncontradaException e) {
//			return ResponseEntity.notFound().build();
//		} catch (EntidadeEmUsoException e) {
//			return ResponseEntity.status(HttpStatus.CONFLICT).build();
//		}
//	}

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Long id) {

        cadastroCozinhaService.deletar(id);
        return ResponseEntity.noContent().build();
    }


}
