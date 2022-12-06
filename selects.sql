-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
 SELECT 
 	pe.id,
 	pe.status,
 	pe.cliente_id,
 	pr.id,
 	pr.nome,
 	pr.tipo,
 	pr.preço,
 	pr.pts_de_lealdade 	
 FROM
 	pedidos pe
 JOIN 
 	produtos_pedidos pp ON pe.id =  pp.pedido_id 
 JOIN 
 	produtos pr ON pp.produto_id = pr.id;

-- 2)
 SELECT 
 	pe.id
 FROM
 	pedidos pe
 JOIN 
 	produtos_pedidos pp ON pe.id =  pp.pedido_id 
 JOIN 
 	produtos pr ON pp.produto_id = pr.id
 WHERE 
 	pr.nome LIKE 'Fritas';

-- 3)
 SELECT 
  	cl.nome	AS gostam_de_fritas
 FROM
 	clientes cl
 JOIN 
 	pedidos pe ON cl.id = pe.cliente_id
 JOIN 
 	produtos_pedidos pp ON pe.id =  pp.pedido_id 
 JOIN 
 	produtos pr ON pp.produto_id = pr.id
  WHERE 
 	pr.nome LIKE 'Fritas';

-- 4)
 SELECT 
  	SUM(pr.preço)
 FROM
 	clientes cl 
 JOIN 
 	pedidos pe ON cl.id = pe.cliente_id
 JOIN 
 	produtos_pedidos pp ON pe.id =  pp.pedido_id 
 JOIN 
 	produtos pr ON pp.produto_id = pr.id
  WHERE 
 	cl.nome LIKE 'Laura';

-- 5)
 SELECT 
 	pr.nome,
  	Count(pr.nome)
 FROM
 	clientes cl 
 JOIN 
 	pedidos pe ON cl.id = pe.cliente_id
 JOIN 
 	produtos_pedidos pp ON pe.id =  pp.pedido_id 
 JOIN 
 	produtos pr ON pp.produto_id = pr.id
 GROUP BY 
	pr.nome
 ORDER BY 
	pr.nome;