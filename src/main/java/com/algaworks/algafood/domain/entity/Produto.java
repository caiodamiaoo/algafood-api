package com.algaworks.algafood.domain.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

@Data
@Entity
@Table(name = "tab_produto")
public class Produto {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome_produto")
    private String nome;

    @Column(name = "descricao_produto")
    private String descricaoProduto;

    @Column(name = "preco_produto")
    private BigDecimal precoProduto;

    @Column(name = "status")
    private Boolean ativo;

    @ManyToOne
    @JoinColumn(name = "restaurante_id_produto")
    private Restaurante restaurante;
}
