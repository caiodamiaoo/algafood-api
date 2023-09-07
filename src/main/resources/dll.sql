create table tab_forma_pagamento (
    id bigint not null auto_increment,
     descricao_pagamento varchar(60) not null,
      primary key (id)) engine=InnoDB;


create table tab_grupo (
    id bigint not null auto_increment,
 nome_grupo varchar(60) not null,
  primary key (id)) engine=InnoDB;

create table tab_grupo_permissao (
    grupo_id bigint not null,
 permissao_id bigint not null,
 primary key (grupo_id, permissao_id)) engine=InnoDB;

create table tab_permissao (
    id bigint not null auto_increment,
     descricao_permissao varchar(60) not null,
      nome_permissao varchar(100 not null),
       primary key (id)) engine=InnoDB;

create table tab_produto (
    id bigint not null auto_increment,
 status tinybit(1) not null,
  descricao_produto text not null,
  nome_produto varchar(80) not null,
      preco_produto decimal(10,2) not null,
   restaurante_id_produto bigint not null,
    primary key (id)) engine=InnoDB;

create table tab_restaurante (
    id bigint not null auto_increment,
     data_atualizacao datetime not null,
      data_cadastro datetime not null,
       endereco_bairro varchar(60),
        endereco_cep varchar(9),
         endereco_complemento varchar(60),
          endereco_logradouro varchar(100),
           endereco_numero varchar(20),
            nome_restaurante varchar(80) not null,
             taxa_frete decimal(10,2) not null,
              cozinha_codigo bigint not null,
               endereco_cidade_id bigint,
                primary key (id)) engine=InnoDB;

create table tab_restaurante_forma_pagamento (
    restaurante_id bigint not null,
     forma_pagamento_id bigint not null,
    primary key (restaurante_id,forma_pagamento_id)) engine=InnoDB;

create table tab_usuario (
    id bigint not null auto_increment,
     data_cadastro_usuario datetime not null,
         email_usuario varchar(255) not null,
          nome_usuario varchar(80) not null,
           senha_usuario varchar(255) not null,
            primary key (id)) engine=InnoDB;

create table tab_usuario_grupo (
    usuario_id bigint not null,
     grupo_id bigint not null,
     primary key (usuario_id,grupo_id)) engine=InnoDB;

alter table tab_cidade add constraint fk_cidade_estado foreign key (estado_codigo) references tab_estado (id);
alter table tab_grupo_permissao add constraint fk_grupo_permissao_permissao foreign key (permissao_id) references tab_permissao (id);
alter table tab_grupo_permissao add constraint fk_grupo_permissao_grupo foreign key (grupo_id) references tab_grupo (id);
alter table tab_produto add constraint fk_produto_restaurante foreign key (restaurante_id_produto) references tab_restaurante (id);
alter table tab_restaurante add constraint fk_restaurante_cozinha foreign key (cozinha_codigo) references tab_cozinha (id);
alter table tab_restaurante add constraint fk_restaurante_cidade foreign key (endereco_cidade_id) references tab_cidade (id);
alter table tab_restaurante_forma_pagamento add constraint fk_rest_forma_pagto_forma_pagto foreign key (forma_pagamento_id) references tab_forma_pagamento (id);
alter table tab_restaurante_forma_pagamento add constraint fk_rest_forma_pagto_restaurante foreign key (restaurante_id) references tab_restaurante (id);
alter table tab_usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references tab_grupo (id);
alter table tab_usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references tab_usuario (id);
create table tab_cidade (id bigint not null auto_increment, nome_cidade varchar(255), estado_codigo bigint, primary key (id)) engine=InnoDB;
create table tab_cozinha (id bigint not null auto_increment, nome_cozinha varchar(255), primary key (id)) engine=InnoDB;
create table tab_estado (id bigint not null auto_increment, nome_estado varchar(255), primary key (id)) engine=InnoDB;
create table tab_forma_pagamento (id bigint not null auto_increment, descricao_pagamento varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo (id bigint not null auto_increment, nome_grupo varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table tab_permissao (id bigint not null auto_increment, descricao_permissao varchar(255), nome_permissao varchar(255), primary key (id)) engine=InnoDB;
create table tab_produto (id bigint not null auto_increment, status bit, descricao_produto varchar(255), nome_produto varchar(255), preco_produto decimal(38,2), restaurante_id_produto bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome_restaurante varchar(255), taxa_frete decimal(38,2), cozinha_codigo bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table tab_usuario (id bigint not null auto_increment, data_cadastro_usuario datetime(6), email_usuario varchar(255), nome_usuario varchar(255), senha_usuario varchar(255), primary key (id)) engine=InnoDB;
create table tab_usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table tab_cidade add constraint FKqpo94irhv8702k3h93tx8tjwo foreign key (estado_codigo) references tab_estado (id);
alter table tab_grupo_permissao add constraint FK3r2dl7rlpqshib9hblqo4m1kd foreign key (permissao_id) references tab_permissao (id);
alter table tab_grupo_permissao add constraint FKf2sadhxudhfcbq3e6t7n7uk4d foreign key (grupo_id) references tab_grupo (id);
alter table tab_produto add constraint FKg1j9t90x5lch8mdi0my4oxfj9 foreign key (restaurante_id_produto) references tab_restaurante (id);
alter table tab_restaurante add constraint FKorshpc1hrxh6aw7hrrb3t48j2 foreign key (cozinha_codigo) references tab_cozinha (id);
alter table tab_restaurante add constraint FKc38xcl49t59w9utt67nucwiq3 foreign key (endereco_cidade_id) references tab_cidade (id);
alter table tab_restaurante_forma_pagamento add constraint FK6bjo1y2mobnx6urkledk5w0j0 foreign key (forma_pagamento_id) references tab_forma_pagamento (id);
alter table tab_restaurante_forma_pagamento add constraint FKih43y6elj3ry9q9bqdsnxtcil foreign key (restaurante_id) references tab_restaurante (id);
alter table tab_usuario_grupo add constraint FK60t70t9esj16stgrttaf22r0r foreign key (grupo_id) references tab_grupo (id);
alter table tab_usuario_grupo add constraint FKr2bbsd9qpdrq2xn7eolxiekw4 foreign key (usuario_id) references tab_usuario (id);
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
insert into tab_forma_pagamento (id, descricao_pagamento) values (1, 'Cartao de crédito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (2, 'Cartao de débito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (3, 'Dinheiro');
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,3);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,2);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,3);
create table tab_cidade (id bigint not null auto_increment, nome_cidade varchar(255), estado_codigo bigint, primary key (id)) engine=InnoDB;
create table tab_cozinha (id bigint not null auto_increment, nome_cozinha varchar(255), primary key (id)) engine=InnoDB;
create table tab_estado (id bigint not null auto_increment, nome_estado varchar(255), primary key (id)) engine=InnoDB;
create table tab_forma_pagamento (id bigint not null auto_increment, descricao_pagamento varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo (id bigint not null auto_increment, nome_grupo varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table tab_permissao (id bigint not null auto_increment, descricao_permissao varchar(255), nome_permissao varchar(255), primary key (id)) engine=InnoDB;
create table tab_produto (id bigint not null auto_increment, status bit, descricao_produto varchar(255), nome_produto varchar(255), preco_produto decimal(38,2), restaurante_id_produto bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome_restaurante varchar(255), taxa_frete decimal(38,2), cozinha_codigo bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table tab_usuario (id bigint not null auto_increment, data_cadastro_usuario datetime(6), email_usuario varchar(255), nome_usuario varchar(255), senha_usuario varchar(255), primary key (id)) engine=InnoDB;
create table tab_usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table tab_cidade add constraint FKqpo94irhv8702k3h93tx8tjwo foreign key (estado_codigo) references tab_estado (id);
alter table tab_grupo_permissao add constraint FK3r2dl7rlpqshib9hblqo4m1kd foreign key (permissao_id) references tab_permissao (id);
alter table tab_grupo_permissao add constraint FKf2sadhxudhfcbq3e6t7n7uk4d foreign key (grupo_id) references tab_grupo (id);
alter table tab_produto add constraint FKg1j9t90x5lch8mdi0my4oxfj9 foreign key (restaurante_id_produto) references tab_restaurante (id);
alter table tab_restaurante add constraint FKorshpc1hrxh6aw7hrrb3t48j2 foreign key (cozinha_codigo) references tab_cozinha (id);
alter table tab_restaurante add constraint FKc38xcl49t59w9utt67nucwiq3 foreign key (endereco_cidade_id) references tab_cidade (id);
alter table tab_restaurante_forma_pagamento add constraint FK6bjo1y2mobnx6urkledk5w0j0 foreign key (forma_pagamento_id) references tab_forma_pagamento (id);
alter table tab_restaurante_forma_pagamento add constraint FKih43y6elj3ry9q9bqdsnxtcil foreign key (restaurante_id) references tab_restaurante (id);
alter table tab_usuario_grupo add constraint FK60t70t9esj16stgrttaf22r0r foreign key (grupo_id) references tab_grupo (id);
alter table tab_usuario_grupo add constraint FKr2bbsd9qpdrq2xn7eolxiekw4 foreign key (usuario_id) references tab_usuario (id);
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
insert into tab_forma_pagamento (id, descricao_pagamento) values (1, 'Cartao de crédito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (2, 'Cartao de débito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (3, 'Dinheiro');
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,3);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,2);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,3);
create table tab_cidade (id bigint not null auto_increment, nome_cidade varchar(255), estado_codigo bigint, primary key (id)) engine=InnoDB;
create table tab_cozinha (id bigint not null auto_increment, nome_cozinha varchar(255), primary key (id)) engine=InnoDB;
create table tab_estado (id bigint not null auto_increment, nome_estado varchar(255), primary key (id)) engine=InnoDB;
create table tab_forma_pagamento (id bigint not null auto_increment, descricao_pagamento varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo (id bigint not null auto_increment, nome_grupo varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table tab_permissao (id bigint not null auto_increment, descricao_permissao varchar(255), nome_permissao varchar(255), primary key (id)) engine=InnoDB;
create table tab_produto (id bigint not null auto_increment, status bit, descricao_produto varchar(255), nome_produto varchar(255), preco_produto decimal(38,2), restaurante_id_produto bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome_restaurante varchar(255), taxa_frete decimal(38,2), cozinha_codigo bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table tab_usuario (id bigint not null auto_increment, data_cadastro_usuario datetime(6), email_usuario varchar(255), nome_usuario varchar(255), senha_usuario varchar(255), primary key (id)) engine=InnoDB;
create table tab_usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table tab_cidade add constraint FKqpo94irhv8702k3h93tx8tjwo foreign key (estado_codigo) references tab_estado (id);
alter table tab_grupo_permissao add constraint FK3r2dl7rlpqshib9hblqo4m1kd foreign key (permissao_id) references tab_permissao (id);
alter table tab_grupo_permissao add constraint FKf2sadhxudhfcbq3e6t7n7uk4d foreign key (grupo_id) references tab_grupo (id);
alter table tab_produto add constraint FKg1j9t90x5lch8mdi0my4oxfj9 foreign key (restaurante_id_produto) references tab_restaurante (id);
alter table tab_restaurante add constraint FKorshpc1hrxh6aw7hrrb3t48j2 foreign key (cozinha_codigo) references tab_cozinha (id);
alter table tab_restaurante add constraint FKc38xcl49t59w9utt67nucwiq3 foreign key (endereco_cidade_id) references tab_cidade (id);
alter table tab_restaurante_forma_pagamento add constraint FK6bjo1y2mobnx6urkledk5w0j0 foreign key (forma_pagamento_id) references tab_forma_pagamento (id);
alter table tab_restaurante_forma_pagamento add constraint FKih43y6elj3ry9q9bqdsnxtcil foreign key (restaurante_id) references tab_restaurante (id);
alter table tab_usuario_grupo add constraint FK60t70t9esj16stgrttaf22r0r foreign key (grupo_id) references tab_grupo (id);
alter table tab_usuario_grupo add constraint FKr2bbsd9qpdrq2xn7eolxiekw4 foreign key (usuario_id) references tab_usuario (id);
insert into tab_cozinha(nome_cozinha) values ('Tailandesa');
insert into tab_cozinha(nome_cozinha) values ('Indiana');
insert into tab_cozinha(nome_cozinha) values ('Americana');
insert into tab_cozinha(nome_cozinha) values ('Italiana');
insert into tab_estado(nome_estado) values ('Pará');
insert into tab_estado(nome_estado) values ('São Paulo');
insert into tab_estado(nome_estado) values ('Macapá');
insert into tab_cidade(nome_cidade, estado_codigo) values ('Belém', 1);
insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, data_cadastro, data_atualizacao) values ('Flongfood', 12, 1, utc_timestamp, utc_timestamp);
insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, data_cadastro, data_atualizacao) values ('Teste', 12, 1, 1, '66613-080', 'Conj imperio', '306','almirante barroso', 'Souza', utc_timestamp, utc_timestamp);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse', 'Gamer', 10, null, 1);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse2', 'Gamer', 15, null, 1);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Teclado', 'Gamer', 20, null, 2);
insert into tab_forma_pagamento (id, descricao_pagamento) values (1, 'Cartao de crédito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (2, 'Cartao de débito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (3, 'Dinheiro');
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,3);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,2);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,3);
create table tab_cidade (id bigint not null auto_increment, nome_cidade varchar(255), estado_codigo bigint, primary key (id)) engine=InnoDB;
create table tab_cozinha (id bigint not null auto_increment, nome_cozinha varchar(255), primary key (id)) engine=InnoDB;
create table tab_estado (id bigint not null auto_increment, nome_estado varchar(255), primary key (id)) engine=InnoDB;
create table tab_forma_pagamento (id bigint not null auto_increment, descricao_pagamento varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo (id bigint not null auto_increment, nome_grupo varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table tab_permissao (id bigint not null auto_increment, descricao_permissao varchar(255), nome_permissao varchar(255), primary key (id)) engine=InnoDB;
create table tab_produto (id bigint not null auto_increment, status bit, descricao_produto varchar(255), nome_produto varchar(255), preco_produto decimal(38,2), restaurante_id_produto bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome_restaurante varchar(255), taxa_frete decimal(38,2), cozinha_codigo bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table tab_usuario (id bigint not null auto_increment, data_cadastro_usuario datetime(6), email_usuario varchar(255), nome_usuario varchar(255), senha_usuario varchar(255), primary key (id)) engine=InnoDB;
create table tab_usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table tab_cidade add constraint FKqpo94irhv8702k3h93tx8tjwo foreign key (estado_codigo) references tab_estado (id);
alter table tab_grupo_permissao add constraint FK3r2dl7rlpqshib9hblqo4m1kd foreign key (permissao_id) references tab_permissao (id);
alter table tab_grupo_permissao add constraint FKf2sadhxudhfcbq3e6t7n7uk4d foreign key (grupo_id) references tab_grupo (id);
alter table tab_produto add constraint FKg1j9t90x5lch8mdi0my4oxfj9 foreign key (restaurante_id_produto) references tab_restaurante (id);
alter table tab_restaurante add constraint FKorshpc1hrxh6aw7hrrb3t48j2 foreign key (cozinha_codigo) references tab_cozinha (id);
alter table tab_restaurante add constraint FKc38xcl49t59w9utt67nucwiq3 foreign key (endereco_cidade_id) references tab_cidade (id);
alter table tab_restaurante_forma_pagamento add constraint FK6bjo1y2mobnx6urkledk5w0j0 foreign key (forma_pagamento_id) references tab_forma_pagamento (id);
alter table tab_restaurante_forma_pagamento add constraint FKih43y6elj3ry9q9bqdsnxtcil foreign key (restaurante_id) references tab_restaurante (id);
alter table tab_usuario_grupo add constraint FK60t70t9esj16stgrttaf22r0r foreign key (grupo_id) references tab_grupo (id);
alter table tab_usuario_grupo add constraint FKr2bbsd9qpdrq2xn7eolxiekw4 foreign key (usuario_id) references tab_usuario (id);
insert into tab_cozinha(nome_cozinha) values ('Tailandesa');
insert into tab_cozinha(nome_cozinha) values ('Indiana');
insert into tab_cozinha(nome_cozinha) values ('Americana');
insert into tab_cozinha(nome_cozinha) values ('Italiana');
insert into tab_estado(nome_estado) values ('Pará');
insert into tab_estado(nome_estado) values ('São Paulo');
insert into tab_estado(nome_estado) values ('Macapá');
insert into tab_cidade(nome_cidade, estado_codigo) values ('Belém', 1);
insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, data_cadastro, data_atualizacao) values ('Flongfood', 12, 1, utc_timestamp, utc_timestamp);
insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, data_cadastro, data_atualizacao) values ('Teste', 12, 1, 1, '66613-080', 'Conj imperio', '306','almirante barroso', 'Souza', utc_timestamp, utc_timestamp);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse', 'Gamer', 10, null, 1);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse2', 'Gamer', 15, null, 1);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Teclado', 'Gamer', 20, null, 2);
insert into tab_forma_pagamento (id, descricao_pagamento) values (1, 'Cartao de crédito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (2, 'Cartao de débito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (3, 'Dinheiro');
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,3);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,2);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,3);
create table tab_cidade (id bigint not null auto_increment, nome_cidade varchar(255), estado_codigo bigint, primary key (id)) engine=InnoDB;
create table tab_cozinha (id bigint not null auto_increment, nome_cozinha varchar(255), primary key (id)) engine=InnoDB;
create table tab_estado (id bigint not null auto_increment, nome_estado varchar(255), primary key (id)) engine=InnoDB;
create table tab_forma_pagamento (id bigint not null auto_increment, descricao_pagamento varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo (id bigint not null auto_increment, nome_grupo varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table tab_permissao (id bigint not null auto_increment, descricao_permissao varchar(255), nome_permissao varchar(255), primary key (id)) engine=InnoDB;
create table tab_produto (id bigint not null auto_increment, status bit, descricao_produto varchar(255), nome_produto varchar(255), preco_produto decimal(38,2), restaurante_id_produto bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome_restaurante varchar(255), taxa_frete decimal(38,2), cozinha_codigo bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table tab_usuario (id bigint not null auto_increment, data_cadastro_usuario datetime(6), email_usuario varchar(255), nome_usuario varchar(255), senha_usuario varchar(255), primary key (id)) engine=InnoDB;
create table tab_usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table tab_cidade add constraint FKqpo94irhv8702k3h93tx8tjwo foreign key (estado_codigo) references tab_estado (id);
alter table tab_grupo_permissao add constraint FK3r2dl7rlpqshib9hblqo4m1kd foreign key (permissao_id) references tab_permissao (id);
alter table tab_grupo_permissao add constraint FKf2sadhxudhfcbq3e6t7n7uk4d foreign key (grupo_id) references tab_grupo (id);
alter table tab_produto add constraint FKg1j9t90x5lch8mdi0my4oxfj9 foreign key (restaurante_id_produto) references tab_restaurante (id);
alter table tab_restaurante add constraint FKorshpc1hrxh6aw7hrrb3t48j2 foreign key (cozinha_codigo) references tab_cozinha (id);
alter table tab_restaurante add constraint FKc38xcl49t59w9utt67nucwiq3 foreign key (endereco_cidade_id) references tab_cidade (id);
alter table tab_restaurante_forma_pagamento add constraint FK6bjo1y2mobnx6urkledk5w0j0 foreign key (forma_pagamento_id) references tab_forma_pagamento (id);
alter table tab_restaurante_forma_pagamento add constraint FKih43y6elj3ry9q9bqdsnxtcil foreign key (restaurante_id) references tab_restaurante (id);
alter table tab_usuario_grupo add constraint FK60t70t9esj16stgrttaf22r0r foreign key (grupo_id) references tab_grupo (id);
alter table tab_usuario_grupo add constraint FKr2bbsd9qpdrq2xn7eolxiekw4 foreign key (usuario_id) references tab_usuario (id);
insert into tab_cozinha(nome_cozinha) values ('Tailandesa');
insert into tab_cozinha(nome_cozinha) values ('Indiana');
insert into tab_cozinha(nome_cozinha) values ('Americana');
insert into tab_cozinha(nome_cozinha) values ('Italiana');
insert into tab_estado(nome_estado) values ('Pará');
insert into tab_estado(nome_estado) values ('São Paulo');
insert into tab_estado(nome_estado) values ('Macapá');
insert into tab_cidade(nome_cidade, estado_codigo) values ('Belém', 1);
insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, data_cadastro, data_atualizacao) values ('Flongfood', 12, 1, utc_timestamp, utc_timestamp);
insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, data_cadastro, data_atualizacao) values ('Teste', 12, 1, 1, '66613-080', 'Conj imperio', '306','almirante barroso', 'Souza', utc_timestamp, utc_timestamp);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse', 'Gamer', 10, null, 1);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse2', 'Gamer', 15, null, 1);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Teclado', 'Gamer', 20, null, 2);
insert into tab_forma_pagamento (id, descricao_pagamento) values (1, 'Cartao de crédito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (2, 'Cartao de débito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (3, 'Dinheiro');
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,3);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,2);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,3);
create table tab_cidade (id bigint not null auto_increment, nome_cidade varchar(255), estado_codigo bigint, primary key (id)) engine=InnoDB;
create table tab_cozinha (id bigint not null auto_increment, nome_cozinha varchar(255), primary key (id)) engine=InnoDB;
create table tab_estado (id bigint not null auto_increment, nome_estado varchar(255), primary key (id)) engine=InnoDB;
create table tab_forma_pagamento (id bigint not null auto_increment, descricao_pagamento varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo (id bigint not null auto_increment, nome_grupo varchar(255), primary key (id)) engine=InnoDB;
create table tab_grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table tab_permissao (id bigint not null auto_increment, descricao_permissao varchar(255), nome_permissao varchar(255), primary key (id)) engine=InnoDB;
create table tab_produto (id bigint not null auto_increment, status bit, descricao_produto varchar(255), nome_produto varchar(255), preco_produto decimal(38,2), restaurante_id_produto bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome_restaurante varchar(255), taxa_frete decimal(38,2), cozinha_codigo bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table tab_restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table tab_usuario (id bigint not null auto_increment, data_cadastro_usuario datetime(6), email_usuario varchar(255), nome_usuario varchar(255), senha_usuario varchar(255), primary key (id)) engine=InnoDB;
create table tab_usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table tab_cidade add constraint FKqpo94irhv8702k3h93tx8tjwo foreign key (estado_codigo) references tab_estado (id);
alter table tab_grupo_permissao add constraint FK3r2dl7rlpqshib9hblqo4m1kd foreign key (permissao_id) references tab_permissao (id);
alter table tab_grupo_permissao add constraint FKf2sadhxudhfcbq3e6t7n7uk4d foreign key (grupo_id) references tab_grupo (id);
alter table tab_produto add constraint FKg1j9t90x5lch8mdi0my4oxfj9 foreign key (restaurante_id_produto) references tab_restaurante (id);
alter table tab_restaurante add constraint FKorshpc1hrxh6aw7hrrb3t48j2 foreign key (cozinha_codigo) references tab_cozinha (id);
alter table tab_restaurante add constraint FKc38xcl49t59w9utt67nucwiq3 foreign key (endereco_cidade_id) references tab_cidade (id);
alter table tab_restaurante_forma_pagamento add constraint FK6bjo1y2mobnx6urkledk5w0j0 foreign key (forma_pagamento_id) references tab_forma_pagamento (id);
alter table tab_restaurante_forma_pagamento add constraint FKih43y6elj3ry9q9bqdsnxtcil foreign key (restaurante_id) references tab_restaurante (id);
alter table tab_usuario_grupo add constraint FK60t70t9esj16stgrttaf22r0r foreign key (grupo_id) references tab_grupo (id);
alter table tab_usuario_grupo add constraint FKr2bbsd9qpdrq2xn7eolxiekw4 foreign key (usuario_id) references tab_usuario (id);
insert into tab_cozinha(nome_cozinha) values ('Tailandesa');
insert into tab_cozinha(nome_cozinha) values ('Indiana');
insert into tab_cozinha(nome_cozinha) values ('Americana');
insert into tab_cozinha(nome_cozinha) values ('Italiana');
insert into tab_estado(nome_estado) values ('Pará');
insert into tab_estado(nome_estado) values ('São Paulo');
insert into tab_estado(nome_estado) values ('Macapá');
insert into tab_cidade(nome_cidade, estado_codigo) values ('Belém', 1);
insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, data_cadastro, data_atualizacao) values ('Flongfood', 12, 1, utc_timestamp, utc_timestamp);
insert into tab_restaurante(nome_restaurante,taxa_frete,cozinha_codigo, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, data_cadastro, data_atualizacao) values ('Teste', 12, 1, 1, '66613-080', 'Conj imperio', '306','almirante barroso', 'Souza', utc_timestamp, utc_timestamp);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse', 'Gamer', 10, null, 1);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Mouse2', 'Gamer', 15, null, 1);
insert into tab_produto(nome_produto, descricao_produto, preco_produto, status, restaurante_id_produto) values ('Teclado', 'Gamer', 20, null, 2);
insert into tab_forma_pagamento (id, descricao_pagamento) values (1, 'Cartao de crédito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (2, 'Cartao de débito');
insert into tab_forma_pagamento (id, descricao_pagamento) values (3, 'Dinheiro');
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,3);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,1);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,2);
insert into tab_restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (2,3);
