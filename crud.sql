-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO 
	clientes (nome,  lealdade)
VALUES 
	('Georgia', 0);

-- 2)
INSERT INTO 
	pedidos (status, cliente_id)
VALUES 
	('Recebido', 6);

-- 3)
INSERT INTO
	produtos_pedidos (pedido_id, produto_id)
VALUES 
	(6, 1),
	(6, 2),
	(6, 6),
	(6, 8),
	(6, 8);


-- Leitura

-- 1)
SELECT 
	cl.id, cl.nome, cl.lealdade,
	pe.id, pe.status, pe.cliente_id,
	pr.id, pr.nome, pr.tipo, pr.preço, pr.pts_de_lealdade
FROM 
	clientes cl
JOIN 
	pedidos pe ON cl.id = pe.cliente_id
JOIN 
	produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN 
	produtos pr ON pp.produto_id = pr.id
WHERE 
	cl.nome LIKE 'Georgia';


-- Atualização

-- 1)
UPDATE 
	clientes cl
SET
	lealdade = (
		SELECT 
			SUM(pr.pts_de_lealdade) 
		FROM 
			produtos pr
		JOIN 
			produtos_pedidos pp ON pr.id = pp.produto_id
		JOIN 
			pedidos pe ON pe.id = pp.pedido_id
		JOIN 
			clientes cl ON pe.cliente_id = cl.id
		WHERE 
			cl.nome LIKE 'Georgia'
	)
WHERE 
	cl.nome LIKE 'Georgia';



-- Deleção

-- 1) 
WHERE 
	cl.nome LIKE 'Georgia';

DELETE FROM 
	clientes 
WHERE 
	nome LIKE 'Marcelo'
RETURNING *;


