/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50733
Source Host           : localhost:3306
Source Database       : eleicao

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2022-10-21 22:58:06
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
INSERT INTO `estados` VALUES ('2', 'Alagoas', '1724217', 'AL', '03-alagoas-circle.png');
INSERT INTO `estados` VALUES ('3', 'Amapá', '432161', 'AP', '04-amapa-circle.png');
INSERT INTO `estados` VALUES ('4', 'Amazonas', '2065676', 'AM', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('5', 'Bahia', '8423008', 'BA', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('6', 'Ceará', '5429264', 'CE', '02-acre-circle.png');
INSERT INTO `estados` VALUES ('7', 'Distrito Federal', '1762575', 'DF', '02-acre-circle.png');
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
-- Table structure for projecoes
-- ----------------------------
DROP TABLE IF EXISTS `projecoes`;
CREATE TABLE `projecoes` (
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
  CONSTRAINT `fk_projecao_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of projecoes
-- ----------------------------
INSERT INTO `projecoes` VALUES ('1', '50', '1', '1', '6');
INSERT INTO `projecoes` VALUES ('2', '50', '1', '2', '6');
INSERT INTO `projecoes` VALUES ('3', '50', '2', '1', '6');
INSERT INTO `projecoes` VALUES ('4', '50', '2', '2', '6');
INSERT INTO `projecoes` VALUES ('5', '50', '3', '1', '6');
INSERT INTO `projecoes` VALUES ('6', '50', '3', '2', '6');
INSERT INTO `projecoes` VALUES ('7', '50', '4', '1', '6');
INSERT INTO `projecoes` VALUES ('8', '50', '4', '2', '6');
INSERT INTO `projecoes` VALUES ('9', '50', '5', '1', '6');
INSERT INTO `projecoes` VALUES ('10', '50', '5', '2', '6');
INSERT INTO `projecoes` VALUES ('11', '50', '6', '1', '6');
INSERT INTO `projecoes` VALUES ('12', '50', '6', '2', '6');
INSERT INTO `projecoes` VALUES ('13', '50', '7', '1', '6');
INSERT INTO `projecoes` VALUES ('14', '50', '7', '2', '6');
INSERT INTO `projecoes` VALUES ('15', '50', '8', '1', '6');
INSERT INTO `projecoes` VALUES ('16', '50', '8', '2', '6');
INSERT INTO `projecoes` VALUES ('17', '50', '9', '1', '6');
INSERT INTO `projecoes` VALUES ('18', '50', '9', '2', '6');
INSERT INTO `projecoes` VALUES ('19', '50', '10', '1', '6');
INSERT INTO `projecoes` VALUES ('20', '50', '10', '2', '6');
INSERT INTO `projecoes` VALUES ('21', '50', '11', '1', '6');
INSERT INTO `projecoes` VALUES ('22', '50', '11', '2', '6');
INSERT INTO `projecoes` VALUES ('23', '50', '12', '1', '6');
INSERT INTO `projecoes` VALUES ('24', '50', '12', '2', '6');
INSERT INTO `projecoes` VALUES ('25', '50', '13', '1', '6');
INSERT INTO `projecoes` VALUES ('26', '50', '13', '2', '6');
INSERT INTO `projecoes` VALUES ('27', '50', '14', '1', '6');
INSERT INTO `projecoes` VALUES ('28', '50', '14', '2', '6');
INSERT INTO `projecoes` VALUES ('29', '50', '15', '1', '6');
INSERT INTO `projecoes` VALUES ('30', '50', '15', '2', '6');
INSERT INTO `projecoes` VALUES ('31', '50', '16', '1', '6');
INSERT INTO `projecoes` VALUES ('32', '50', '16', '2', '6');
INSERT INTO `projecoes` VALUES ('33', '50', '17', '1', '6');
INSERT INTO `projecoes` VALUES ('34', '50', '17', '2', '6');
INSERT INTO `projecoes` VALUES ('35', '50', '18', '1', '6');
INSERT INTO `projecoes` VALUES ('36', '50', '18', '2', '6');
INSERT INTO `projecoes` VALUES ('37', '50', '19', '1', '6');
INSERT INTO `projecoes` VALUES ('38', '50', '19', '2', '6');
INSERT INTO `projecoes` VALUES ('39', '50', '20', '1', '6');
INSERT INTO `projecoes` VALUES ('40', '50', '20', '2', '6');
INSERT INTO `projecoes` VALUES ('41', '50', '21', '1', '6');
INSERT INTO `projecoes` VALUES ('42', '50', '21', '2', '6');
INSERT INTO `projecoes` VALUES ('43', '50', '22', '1', '6');
INSERT INTO `projecoes` VALUES ('44', '50', '22', '2', '6');
INSERT INTO `projecoes` VALUES ('45', '50', '23', '1', '6');
INSERT INTO `projecoes` VALUES ('46', '50', '23', '2', '6');
INSERT INTO `projecoes` VALUES ('47', '50', '24', '1', '6');
INSERT INTO `projecoes` VALUES ('48', '50', '24', '2', '6');
INSERT INTO `projecoes` VALUES ('49', '50', '25', '1', '6');
INSERT INTO `projecoes` VALUES ('50', '50', '25', '2', '6');
INSERT INTO `projecoes` VALUES ('51', '50', '26', '1', '6');
INSERT INTO `projecoes` VALUES ('52', '50', '26', '2', '6');
INSERT INTO `projecoes` VALUES ('53', '50', '27', '1', '6');
INSERT INTO `projecoes` VALUES ('54', '50', '27', '2', '6');
INSERT INTO `projecoes` VALUES ('55', '50', '28', '1', '6');
INSERT INTO `projecoes` VALUES ('56', '50', '28', '2', '6');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `dt_cadastro` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', 'TESTE', 'teste@teste', '2022-10-21 19:12:20');
INSERT INTO `usuarios` VALUES ('2', 'TESTE', 'teste@teste', '2022-10-21 19:12:48');
INSERT INTO `usuarios` VALUES ('3', 'testeuniparesp@gmail.com', 'testeuniparesp@gmail.com', '2022-10-21 19:24:59');
INSERT INTO `usuarios` VALUES ('4', 'testeuniparesp@gmail.com', 'testeuniparesp@gmail.com', '2022-10-21 19:29:57');
INSERT INTO `usuarios` VALUES ('5', 'testeuniparesp@gmail.com', 'testeuniparesp@gmail.com', '2022-10-21 19:44:27');
INSERT INTO `usuarios` VALUES ('6', 'testeuniparesp@gmail.com', 'testeuniparesp@gmail.com', '2022-10-21 19:44:57');
