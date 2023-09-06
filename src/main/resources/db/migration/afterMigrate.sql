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

insert into tab_cozinha(nome_cozinha) values ('Tailandesa');
insert into tab_cozinha(nome_cozinha) values ('Indiana');
insert into tab_cozinha(nome_cozinha) values ('Americana');
insert into tab_cozinha(nome_cozinha) values ('Italiana');


insert into tab_estado(nome_estado) values ('Pará');
insert into tab_estado(nome_estado) values ('São Paulo');
insert into tab_estado(nome_estado) values ('Macapá');

insert into tab_cidade(nome_cidade, estado_codigo, nome_estado) values ('Belém', 1, 'Pará');

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