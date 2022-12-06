-- Aqui você deve colocar os códigos SQL referentes à

-- Criação das tabelas

-- Tabela clientes
CREATE TABLE IF NOT EXISTS clientes(
	id BIGSERIAL PRIMARY KEY,
	nome varchar(50) NOT NULL,
	lealdade integer NOT NULL 
);

-- Tabela endereços
CREATE TABLE IF NOT EXISTS enderecos(
	id BIGSERIAL PRIMARY KEY,
	rua varchar(50) NOT NULL,
	numero integer NOT NULL,
	bairro varchar(50) NOT NULL,
	complemento varchar(100),
	cliente_id integer UNIQUE NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

ALTER TABLE
	enderecos 
ADD COLUMN
	cep varchar(9) NOT NULL;

-- Tabela pedidos
CREATE TABLE IF NOT EXISTS pedidos(
	id BIGSERIAL PRIMARY KEY,
	status varchar(50) NOT NULL,
	cliente_id integer  NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Tabela produtos
CREATE TABLE IF NOT EXISTS produtos(
	id BIGSERIAL PRIMARY KEY,
	nome varchar(30) NOT NULL,
	preço float(8) NOT NULL,
	pts_de_lealdade integer NOT null	
);

ALTER TABLE
	produtos 
ADD COLUMN 
	tipo varchar(30) NOT NULL;

-- Tabela produtos_pedidos
CREATE TABLE IF NOT EXISTS produtos_pedidos(
	id BIGSERIAL PRIMARY KEY,
	pedido_id integer NOT NULL,
	FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
	produto_id integer NOT NULL,
	FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
);
