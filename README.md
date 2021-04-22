# Vendedor-Cliente

Projeto criado para a Teknisa
-- Tabelas para criação e execução do banco de dados
CREATE DATABASE representante_cliente;
 USE representante_cliente;

CREATE TABLE `representante_cliente`.`representante`
  (
     `rep_id`            INT NOT NULL auto_increment,
     `rep_nome`          VARCHAR(50) NOT NULL,
     `rep_telefone`      VARCHAR(15) NOT NULL,
     `rep_endereco`      VARCHAR(200) NOT NULL,
     `rep_sexo`          VARCHAR(1) NOT NULL,
     `rep_ativo`         BOOLEAN NOT NULL,
     `rep_data_inclusao` DATETIME NOT NULL,
     PRIMARY KEY (`rep_id`)
  )
engine = innodb; 

--ALTER TABLE `representante` CHANGE `rep_ID` `rep_ID` INT(11) NOT NULL AUTO_INCREMENT;


CREATE TABLE `representante_cliente`.`cliente`
  (
     `cli_id`       INT NOT NULL auto_increment,
     `cli_nome`     VARCHAR(50) NOT NULL,
     `cli_telefone` VARCHAR(15) NOT NULL,
     `rep_id`       INT NOT NULL,
     `cli_endereco` VARCHAR(200) NOT NULL,
     PRIMARY KEY (`cli_id`)
  )
engine = innodb; 


ALTER TABLE `representante_cliente`.`cliente` ADD INDEX `rep_ID_fk` (`rep_ID`);

ALTER TABLE `cliente`
  ADD CONSTRAINT `relacionamento_pedidos_produto` FOREIGN KEY (`rep_id`)
  REFERENCES `representante`(`rep_id`) ON DELETE no action ON UPDATE no action; 
  
  	ALTER TABLE `cliente`
  DROP FOREIGN KEY `relacionamento_pedidos_produto`;

ALTER TABLE `cliente`
  ADD CONSTRAINT `relacionamento_pedidos_produto` FOREIGN KEY (`rep_id`)
  REFERENCES `representante`(`rep_id`) ON DELETE CASCADE ON UPDATE no action; 
