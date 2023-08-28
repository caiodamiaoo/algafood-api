insert into tab_cozinha(nome_cozinha) values ('Tailandesa');
insert into tab_cozinha(nome_cozinha) values ('Indiana');

insert into tab_estado(nome_estado) values ('Pará');
insert into tab_estado(nome_estado) values ('São Paulo');
insert into tab_estado(nome_estado) values ('Macapá');

insert into tab_cidade(nome_cidade, estado_codigo) values ('Belém', 1);

insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, data_cadastro, data_atualizacao) values ('Flongfood', 12, 1, utc_timestamp, utc_timestamp);
insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, data_cadastro, data_atualizacao) values ('Teste', 12, 1, 1, '66613-080', 'Conj imperio', '306','almirante barroso', 'Souza', utc_timestamp, utc_timestamp);

insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse', 'Gamer', 10, null, 1);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse2', 'Gamer', 15, null, 1);

insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Teclado', 'Gamer', 20, null, 2);

insert into tab_forma_pagamento (forma_pagamento_id, descricao_pagamento) values (1, 'Cartao de crédito');
insert into tab_forma_pagamento (forma_pagamento_id, descricao_pagamento) values (2, 'Cartao de débito');
insert into tab_forma_pagamento (forma_pagamento_id, descricao_pagamento) values (3, 'Dinheiro');

insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,2);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,3);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,2);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,3);