package com.algaworks.algafood.domain.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@Entity
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Table(name = "tab_grupo")
public class Grupo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    private Long id;

    @Column(name = "nome_grupo")
    private String nomeGrupo;

    @ManyToMany
    @JoinColumn(name = "permissao_grupo_id")
    private List<Permissao> permissoes;
}
