create table tab_estado(
                           id bigint not null auto_increment,
                           nome_estado varchar(80) not null,

                           primary key (id)
) engine=InnoDB default charset=utf8;