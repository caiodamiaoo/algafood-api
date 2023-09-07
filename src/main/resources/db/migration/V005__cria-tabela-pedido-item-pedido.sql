create table tab_item_pedido (
                                 id bigint not null auto_increment,
                                 descricao varchar(100),
                                 preco_total decimal(10,2) not null,
                                 preco_unitario decimal(10,2) not null,
                                 quantidade integer not null,
                                 pedido_id bigint not null,
                                 produto_id bigint not null,
                                 primary key (id)) engine=InnoDB;

create table tab_pedido (
                            id bigint not null auto_increment,
                            data_cancelamento datetime(6) ,
                            data_confirmacao datetime(6) ,
                            data_criacao datetime(6) not null,
                            data_entrega datetime(6),
                            endereco_bairro varchar(100) not null,
                            endereco_cep varchar(20) not null,
                            endereco_complemento varchar(100),
                            endereco_logradouro varchar(100) not null,
                            endereco_numero varchar(20) not null,
                            status varchar(10),
                            subtotal decimal(10,2) not null,
                            taxa_frete decimal(10,2) not null,
                            valor_total decimal(10,2) not null,
                            cliente_id bigint not null,
                            endereco_cidade_id bigint not null,
                            forma_pagamento_id bigint not null,
                            restaurante_id bigint not null,
                            primary key (id)) engine=InnoDB;

alter table tab_item_pedido add constraint fk_item_pedido_pedido foreign key (pedido_id) references tab_pedido (id);
alter table tab_item_pedido add constraint fk_item_pedido_produto foreign key (produto_id) references tab_produto (id);

alter table tab_pedido add constraint fk_pedido_cliente foreign key (cliente_id) references tab_usuario(id);
alter table tab_pedido add constraint fk_pedido_forma_pagamento foreign key (forma_pagamento_id) references tab_forma_pagamento(id);
alter table tab_pedido add constraint fk_pedido_restaurante foreign key (restaurante_id) references tab_restaurante(id);