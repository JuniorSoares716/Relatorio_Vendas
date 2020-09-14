-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.13-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para teste
CREATE DATABASE IF NOT EXISTS `teste` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `teste`;

-- Copiando estrutura para tabela teste.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela teste.cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id_cliente`, `nome`) VALUES
	(1, 'Maria'),
	(2, 'José'),
	(3, 'João');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela teste.item
CREATE TABLE IF NOT EXISTS `item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `tipo_item` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela teste.item: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`id_item`, `descricao`, `quantidade`, `valor`, `tipo_item`) VALUES
	(1, 'Lente1', 100, 13, 1),
	(2, 'Lente2', 100, 12, 1),
	(3, 'Lente3', 100, 15, 1),
	(4, 'Lente4', 100, 31, 1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- Copiando estrutura para tabela teste.transacao
CREATE TABLE IF NOT EXISTS `transacao` (
  `id_transacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_vendedor` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `tipo_transacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_transacao`),
  KEY `FK_transacao_cliente` (`id_cliente`),
  KEY `FK_transacao_vendedor` (`id_vendedor`),
  CONSTRAINT `FK_transacao_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FK_transacao_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela teste.transacao: ~38 rows (aproximadamente)
/*!40000 ALTER TABLE `transacao` DISABLE KEYS */;
INSERT INTO `transacao` (`id_transacao`, `id_cliente`, `id_vendedor`, `data`, `tipo_transacao`) VALUES
	(1, 1, 1, '2020-01-09', 1),
	(2, 1, 1, '2020-02-09', 1),
	(3, 1, 1, '2020-03-09', 1),
	(4, 1, 1, '2020-04-10', 1),
	(5, 1, 1, '2020-05-11', 1),
	(6, 1, 1, '2020-06-12', 1),
	(7, 1, 1, '2020-07-13', 1),
	(8, 1, 1, '2020-08-14', 1),
	(9, 1, 1, '2020-09-15', 1),
	(10, 2, 2, '2020-02-09', 1),
	(11, 3, 3, '2020-01-09', 1),
	(12, 3, 3, '2020-02-10', 1),
	(13, 2, 3, '2020-03-11', 1),
	(14, 2, 3, '2020-04-12', 1),
	(15, 3, 3, '2020-05-13', 1),
	(16, 3, 3, '2020-06-14', 1),
	(17, 1, 3, '2020-07-15', 1),
	(18, 2, 3, '2020-01-10', 1),
	(19, 2, 2, '2020-02-11', 1),
	(20, 3, 1, '2020-03-12', 1),
	(22, 2, 3, '2020-01-10', 1),
	(23, 2, 2, '2020-02-11', 1),
	(24, 3, 1, '2020-03-12', 1),
	(25, 3, 3, '2020-04-12', 1),
	(26, 2, 2, '2020-05-13', 1),
	(27, 2, 3, '2020-06-14', 1),
	(28, 3, 1, '2020-08-15', 1),
	(29, 2, 2, '2020-09-09', 1),
	(30, 3, 2, '2020-09-19', 1),
	(31, 2, 2, '2020-10-09', 1),
	(32, 2, 2, '2020-10-19', 1),
	(33, 3, 2, '2020-10-08', 1),
	(34, 2, 2, '2020-11-01', 1),
	(35, 1, 1, '2020-11-02', 1),
	(36, 3, 3, '2020-11-03', 1),
	(37, 3, 2, '2020-12-09', 1),
	(38, 1, 1, '2020-12-09', 1),
	(39, 2, 3, '2020-12-09', 1);
/*!40000 ALTER TABLE `transacao` ENABLE KEYS */;

-- Copiando estrutura para tabela teste.transacao_item
CREATE TABLE IF NOT EXISTS `transacao_item` (
  `id_transacaoitem` int(11) NOT NULL AUTO_INCREMENT,
  `id_transacao` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_transacaoitem`),
  KEY `FK_transacao_item_transacao` (`id_transacao`),
  KEY `FK_transacao_item_item` (`id_item`),
  CONSTRAINT `FK_transacao_item_item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  CONSTRAINT `FK_transacao_item_transacao` FOREIGN KEY (`id_transacao`) REFERENCES `transacao` (`id_transacao`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela teste.transacao_item: ~49 rows (aproximadamente)
/*!40000 ALTER TABLE `transacao_item` DISABLE KEYS */;
INSERT INTO `transacao_item` (`id_transacaoitem`, `id_transacao`, `id_item`, `quantidade`) VALUES
	(1, 1, 1, 10),
	(2, 1, 2, 10),
	(3, 2, 2, 3),
	(4, 3, 2, 4),
	(5, 4, 1, 1),
	(6, 5, 2, 2),
	(7, 6, 3, 3),
	(8, 1, 3, 4),
	(9, 1, 3, 5),
	(10, 8, 1, 6),
	(11, 9, 2, 7),
	(12, 10, 1, 9),
	(13, 10, 2, 8),
	(14, 10, 3, 12),
	(15, 10, 4, 9),
	(16, 11, 1, 4),
	(17, 12, 2, 6),
	(18, 13, 1, 12),
	(19, 14, 2, 12),
	(20, 15, 3, 1),
	(21, 16, 4, 9),
	(22, 17, 1, 12),
	(23, 18, 2, 5),
	(24, 19, 1, 9),
	(25, 20, 2, 12),
	(27, 23, 1, 7),
	(28, 24, 2, 8),
	(29, 25, 1, 8),
	(30, 26, 2, 1),
	(31, 27, 3, 3),
	(32, 28, 4, 4),
	(33, 29, 1, 12),
	(34, 29, 2, 12),
	(35, 30, 1, 12),
	(36, 30, 2, 12),
	(37, 31, 3, 12),
	(38, 32, 4, 12),
	(39, 32, 1, 12),
	(40, 32, 2, 12),
	(41, 33, 1, 12),
	(42, 33, 2, 12),
	(43, 33, 3, 12),
	(44, 32, 4, 12),
	(45, 34, 1, 12),
	(46, 35, 2, 12),
	(47, 36, 1, 12),
	(48, 37, 2, 12),
	(49, 38, 3, 12),
	(50, 39, 4, 12);
/*!40000 ALTER TABLE `transacao_item` ENABLE KEYS */;

-- Copiando estrutura para tabela teste.vendedor
CREATE TABLE IF NOT EXISTS `vendedor` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela teste.vendedor: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` (`id_vendedor`, `nome`) VALUES
	(1, 'Francisco'),
	(2, 'Antônio'),
	(3, 'Raimundo');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
