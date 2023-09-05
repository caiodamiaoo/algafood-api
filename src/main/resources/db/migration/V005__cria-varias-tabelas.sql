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
                               nome_permissao varchar(100) not null,
       primary key (id)) engine=InnoDB;

create table tab_produto (
                             id bigint not null auto_increment,
                             status bit not null,
                             descricao_produto varchar(200) not null,
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

alter table tab_cidade add column estado_codigo bigint;
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
