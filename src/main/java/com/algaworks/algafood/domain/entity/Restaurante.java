package com.algaworks.algafood.domain.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.ManyToAny;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.UpdateTimestamp;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "tab_restaurante")
public class Restaurante {
	
	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name = "nome_restaurante")
	private String nome;
	@Column(name = "taxa_frete")
	private BigDecimal taxaFrete;	
	
	@ManyToOne
	@JoinColumn(name="cozinha_codigo")
	private Cozinha cozinha;

	@JsonIgnore
	@CreationTimestamp
	@Column(name = "data_cadastro", nullable = false, columnDefinition = "datetime")
	private LocalDateTime dataCadastro;

	@JsonIgnore
	@UpdateTimestamp
	@Column(name = "data_atualizacao", nullable = false, columnDefinition = "datetime")
	private LocalDateTime dataAtualizacao;
	@Embedded
	@JsonIgnore
	private Endereco endereco;

	@OneToMany(mappedBy = "restaurante")
	private List<Produto> produtos;

	@JsonIgnore
	@ManyToMany
	@JoinTable(name = "restaurante_forma_pagamento",
			joinColumns = @JoinColumn(name = "id"),
			inverseJoinColumns = @JoinColumn(name = "forma_pagamento_id"))
	private List<FormaPagamento> formasPagamento = new ArrayList <>();
}
