/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50733
Source Host           : localhost:3306
Source Database       : eleicao

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2022-10-21 15:07:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for candidatos
-- ----------------------------
DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE `candidatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  `Apelido` varchar(45) NOT NULL,
  `Partido` varchar(100) NOT NULL,
  `sigla` varchar(8) NOT NULL,
  `numero` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of candidatos
-- ----------------------------
INSERT INTO `candidatos` VALUES ('1', 'Luiz Inácio Lula da Silva\r\n', 'Lula', 'Partido dos Trabalhadores', 'PT', '13');
INSERT INTO `candidatos` VALUES ('2', 'Jair Messias Bolsonaro\r\n', 'Bolsonaro', 'Partido Liberal', 'PL', '22');

-- ----------------------------
-- Table structure for estados
-- ----------------------------
DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(100) NOT NULL,
  `votos_validos` int(11) NOT NULL,
  `UF` varchar(3) NOT NULL,
  `bandeira` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estados
-- ----------------------------
INSERT INTO `estados` VALUES ('1', 'Acre', '440917', 'AC', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('2', 'Alagoas', '1724217', 'AL', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('3', 'Amapá', '432161', 'AP', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('4', 'Amazonas', '2065676', 'AM', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('5', 'Bahia', '8423008', 'BA', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('6', 'Ceará', '5429264', 'CE', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('7', 'DF', '1762575', 'DF', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('8', 'Espirito Santo', '2221130', 'ES', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('9', 'Goiais', '3681469', 'GO', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('10', 'Maranhão', '3781645', 'MA', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('11', 'Mato Grosso', '1842888', 'MT', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('12', 'Mato Grosso do Sul', '1506989', 'MS', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('13', 'Minas Gerais', '12016633', 'MG', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('14', 'Paraná', '6566764', 'PA', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('15', 'Paraíba', '2421688', 'PB', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('16', 'Pará', '4679936', 'PR', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('17', 'Pernambuco', '5452009', 'PE', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('18', 'Piauí', '2044386', 'PI', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('19', 'Rio de Janeiro', '9456677', 'RJ', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('20', 'Rio Grande do Norte', '2007264', 'RN', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('21', 'Rio Grande do Sul', '6637752', 'RS', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('22', 'Rondônia', '903235', 'RO', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('23', 'Roraima', '298369', 'RR', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('24', 'Santa Catarina', '4330984', 'SC', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('25', 'Sergipe', '1298432', 'SE', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('26', 'São Paulo', '25656334', 'SP', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('27', 'Tocantis ', '861792', 'TO', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('28', 'Exterior', '294525', 'EX', '02-acre-circle.png');

-- ----------------------------
-- Table structure for projecao
-- ----------------------------
DROP TABLE IF EXISTS `projecao`;
CREATE TABLE `projecao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `porcentagem` float NOT NULL,
  `estados_id` int(11) NOT NULL,
  `candidatos_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projecao_estados_idx` (`estados_id`),
  KEY `fk_projecao_candidatos1_idx` (`candidatos_id`),
  KEY `fk_projecao_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_projecao_candidatos1` FOREIGN KEY (`candidatos_id`) REFERENCES `candidatos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projecao_estados` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projecao_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of projecao
-- ----------------------------

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `dt_cadastro` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
