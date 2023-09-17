set foreign_key_checks = 0;

delete from tab_cidade;
delete from tab_cozinha;
delete from tab_estado;
delete from tab_forma_pagamento;
delete from tab_grupo;
delete from tab_grupo_permissao;
delete from tab_permissao;
delete from tab_produto;
delete from tab_restaurante;
delete from tab_restaurante_forma_pagamento;
delete from tab_usuario;
delete from tab_usuario_grupo;
delete from tab_pedido;
delete from tab_item_pedido;
set foreign_key_checks = 1;

alter table tab_cidade auto_increment = 1;
alter table tab_cozinha auto_increment = 1;
alter table tab_estado auto_increment = 1;
alter table tab_forma_pagamento auto_increment = 1;
alter table tab_grupo auto_increment = 1;
alter table tab_permissao auto_increment = 1;
alter table tab_produto auto_increment = 1;
alter table tab_restaurante auto_increment = 1;
alter table tab_usuario auto_increment = 1;
alter table tab_pedido auto_increment = 1;
alter table tab_item_pedido auto_increment = 1;



insert into tab_cozinha(nome_cozinha) values ('Tailandesa');
insert into tab_cozinha(nome_cozinha) values ('Indiana');
insert into tab_cozinha(nome_cozinha) values ('Americana');
insert into tab_cozinha(nome_cozinha) values ('Italiana');

insert into tab_estado(nome_estado) values ('Pará');
insert into tab_estado(nome_estado) values ('São Paulo');
insert into tab_estado(nome_estado) values ('Amapá');

insert into tab_cidade(nome_cidade, estado_codigo) values ('Belém', 1);
insert into tab_cidade(nome_cidade, estado_codigo) values ('Benevides', 1);
insert into tab_cidade(nome_cidade, estado_codigo) values ('Campinas', 2);
insert into tab_cidade(nome_cidade, estado_codigo) values ('Macapá', 3);


insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, data_cadastro, data_atualizacao) values ('Flongfood', 12, 1, utc_timestamp, utc_timestamp);
insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, data_cadastro, data_atualizacao) values ('Teste', 12, 1, 1, '66613-080', 'Conj imperio', '306','almirante barroso', 'Souza', utc_timestamp, utc_timestamp);

insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse', 'Gamer', 10, 1, 1);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse2', 'Gamer', 15, 0, 1);

insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Teclado', 'Gamer', 20, 0, 2);

insert into tab_forma_pagamento (id, descricao_pagamento) values (1, 'Cartao de crédito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (2, 'Cartao de débito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (3, 'Dinheiro');

insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,3);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,2);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,3);

insert into tab_usuario(id, nome_usuario, email_usuario, senha_usuario, data_cadastro_usuario) values (1, 'Caio Damiao', 'caio@exemplo.com', 'teste123', '2023-09-05 16:30:00');
insert into tab_usuario(id, nome_usuario, email_usuario, senha_usuario, data_cadastro_usuario) values (2, 'Raissa Valente', 'raissa@exemplo.com', 'teste1234', '2023-08-05 16:30:00');

INSERT INTO tab_pedido (
    data_cancelamento,
    data_confirmacao,
    data_criacao,
    data_entrega,
    endereco_bairro,
    endereco_cep,
    endereco_complemento,
    endereco_logradouro,
    endereco_numero,
    status,
    subtotal,
    taxa_frete,
    valor_total,
    cliente_id,
    endereco_cidade_id,
    forma_pagamento_id,
    restaurante_id
) VALUES
      (
          null,
          null,
          '2023-09-07 10:00:00',
          null,
          'Downtown',
          '12345-678',
          'Apt 5B',
          '123 Main Street',
          'Apt 5B',
          'CONFIRMADO',
          45.99,
          5.00,
          50.99,
          1,
          1,
          1,
          2
      ),
      (
          '2023-09-06 09:00:00',
          NULL,
          '2023-09-06 08:30:00',
          NULL,
          'Uptown',
          '54321-987',
          'Suite 12',
          '456 Elm Street',
          'Suite 12',
          'CRIADO',
          32.50,
          4.50,
          37.00,
          2,
          2,
          2,
          1
      ),
      (
          NULL,
          NULL,
          '2023-09-05 15:20:00',
          '2023-09-05 16:30:00',
          'Midtown',
          '67890-123',
          'Unit 8C',
          '789 Oak Avenue',
          'Unit 8C',
          'ENTREGUE',
          72.75,
          6.25,
          79.00,
          1,
          3,
          3,
          1
      );

insert into tab_item_pedido(id, quantidade, preco_unitario, preco_total, descricao, pedido_id, produto_id) values (1, 2, 20, 40, 'Mouse', 1, 1);
insert into tab_item_pedido(id, quantidade, preco_unitario, preco_total, descricao, pedido_id, produto_id) values (2, 1, 20, 20, 'Mouse2', 2, 2);
insert into tab_item_pedido(id, quantidade, preco_unitario, preco_total, descricao, pedido_id, produto_id) values (3, 3, 20, 60, 'Teclado', 3, 3);

insert into tab_grupo(id, nome_grupo) values (1, 'Admin');
insert into tab_grupo(id, nome_grupo) values (2, 'Cliente');
insert into tab_grupo(id, nome_grupo) values (3, 'Restaurante');

insert into tab_permissao (id, descricao_permissao, nome_permissao) values (1, 'Permissao geral','Geral');
insert into tab_permissao (id, descricao_permissao, nome_permissao) values (2, 'Solicitar pedidos','Clientes');
insert into tab_permissao (id, descricao_permissao, nome_permissao) values (3, 'Gerar pedido','Restaurantes');

insert into tab_usuario_grupo(usuario_id, grupo_id) values (1, 1);
insert into tab_usuario_grupo(usuario_id, grupo_id) values (1, 3);