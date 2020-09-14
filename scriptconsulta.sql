SELECT
C.nome AS cliente, 
V.nome AS vendedor,
SUM(IF(EXTRACT(MONTH FROM T.data) = 1, I.valor * IT.quantidade, 0)) AS 'JAN',
SUM(IF(EXTRACT(MONTH FROM T.data) = 2, I.valor * IT.quantidade, 0)) AS'FEV',
SUM(IF(EXTRACT(MONTH FROM T.data) = 3, I.valor * IT.quantidade, 0)) AS 'MAC',
SUM(IF(EXTRACT(MONTH FROM T.data) = 4, I.valor * IT.quantidade, 0)) AS 'ABR',
SUM(IF(EXTRACT(MONTH FROM T.data) = 5, I.valor * IT.quantidade, 0)) AS 'MAI',
SUM(IF(EXTRACT(MONTH FROM T.data) = 6, I.valor * IT.quantidade, 0)) AS 'JUN',
SUM(IF(EXTRACT(MONTH FROM T.data) = 7, I.valor * IT.quantidade, 0)) AS 'JUL',
SUM(IF(EXTRACT(MONTH FROM T.data) = 8, I.valor * IT.quantidade, 0)) AS 'AGO',
SUM(IF(EXTRACT(MONTH FROM T.data) = 9, I.valor * IT.quantidade, 0)) AS 'SET',
SUM(IF(EXTRACT(MONTH FROM T.data) = 10, I.valor * IT.quantidade, 0)) AS 'OUT',
SUM(IF(EXTRACT(MONTH FROM T.data) = 11, I.valor * IT.quantidade, 0)) AS 'NOV',
SUM(IF(EXTRACT(MONTH FROM T.data) = 12, I.valor * IT.quantidade, 0)) AS 'DEZ',

SUM((IT.quantidade * I.valor)) AS TOTAL

FROM  
cliente C INNER JOIN transacao T ON C.id_cliente = T.id_cliente
INNER JOIN vendedor V ON T.id_vendedor = V.id_vendedor
INNER JOIN transacao_item IT ON  IT.id_transacao = T.id_transacao
INNER JOIN item I ON  IT.id_item = i.id_item

WHERE 
EXTRACT(YEAR FROM T.data) = '2020'
GROUP BY cliente,vendedor
