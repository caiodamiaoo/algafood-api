package com.algaworks.algafood.api.controller;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

import com.algaworks.algafood.domain.exception.NegocioException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.bind.annotation.*;

import com.algaworks.algafood.domain.entity.Restaurante;
import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.repository.RestauranteRepository;
import com.algaworks.algafood.domain.service.CadastroRestauranteService;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping(value = "/restaurantes", produces = "application/json")
public class RestauranteController {

    @Autowired
    private RestauranteRepository restauranteRepository;

    @Autowired
    private CadastroRestauranteService cadastroRestauranteService;

    @GetMapping
    public List<Restaurante> listar() {

        return restauranteRepository.findAll();
    }

    @GetMapping("/{id}")
    public Restaurante buscar(@PathVariable Long id) {

        return cadastroRestauranteService.buscarOuFalhar(id);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping
    public Restaurante adicionar(@RequestBody Restaurante restaurante) {
        try {
            return cadastroRestauranteService.salvar(restaurante);
        }
        catch (EntidadeNaoEncontradaException e){
            throw new NegocioException(e.getMessage());
        }
    }

    @ResponseStatus(HttpStatus.NOT_FOUND)
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletar(@PathVariable Long id) {

        cadastroRestauranteService.deletar(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/{id}")
    public Restaurante atualizar(@PathVariable Long id, @RequestBody Restaurante restaurante) {

        Restaurante restauranteAtual = cadastroRestauranteService.buscarOuFalhar(id);
        BeanUtils.copyProperties(restaurante, restauranteAtual, "id", "formasPagamento", "endereco", "dataCadastro");
        try {
            return cadastroRestauranteService.salvar(restauranteAtual);
        }
        catch (EntidadeNaoEncontradaException e){
            throw new NegocioException(e.getMessage());
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<?> atualizarParcial(@PathVariable Long id, @RequestBody Map<String, Object> campos) {

        Restaurante restauranteAtual = restauranteRepository.findById(id).orElse(null);
        if (restauranteAtual == null) {
            return ResponseEntity.notFound().build();
        }

        merge(campos, restauranteAtual);
        return null;
    }

    public void merge(Map<String, Object> camposOrigem, Restaurante restauranteDestino) {

        ObjectMapper objectMapper = new ObjectMapper();
        Restaurante restauranteOrigem = objectMapper.convertValue(camposOrigem, Restaurante.class);
        camposOrigem.forEach((nomePropriedade, valorPropriedade) -> {

            Field field = ReflectionUtils.findField(Restaurante.class, nomePropriedade);
            field.setAccessible(true);
            System.out.println(nomePropriedade + " = " + valorPropriedade);

            ReflectionUtils.setField(field, restauranteDestino, valorPropriedade);
        });
    }
}
