-- MySQL Script generated by MySQL Workbench
-- Thu Aug 19 19:36:59 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema upc_sistema_control
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `upc_sistema_control` ;

-- -----------------------------------------------------
-- Schema upc_sistema_control
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `upc_sistema_control` DEFAULT CHARACTER SET latin1 ;
USE `upc_sistema_control` ;

-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_perfil` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_perfil` (
  `idtb_perfil` INT(11) NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `estado` CHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`descripcion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_acceso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_acceso` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_acceso` (
  `idtb_acceso` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  `dniPersona` CHAR(8) NULL,
  `tb_perfil_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtb_acceso`))
ENGINE = InnoDB;

select * from tb_acceso;
-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_seccion`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `upc_sistema_control`.`tb_seccion` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_seccion` (
  `idtb_seccion` INT auto_increment not null,
  `codigoSeccion` VARCHAR(45) NOT NULL,
  `seccion` VARCHAR(45) NULL,
  `tipoSeccion` VARCHAR(45) NULL,
  `estado` CHAR(2) NULL,
  `cantiMin` INT NULL,
  `cantMax` INT NULL,
  PRIMARY KEY (`idtb_seccion`))
ENGINE = InnoDB;

USE `upc_sistema_control` ;



-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_tipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_tipo` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_tipo` (
  `idtb_tipo` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`descripcion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_persona` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_persona` (
  `idtb_persona` INT auto_increment NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `sexo` CHAR(1) NULL,
  `fechaNacimiento` DATE NULL,
  `estado` CHAR(2) NULL,
  `correo` VARCHAR(45) NULL,
  `numeroTelefono` CHAR(11) NULL,
  `dniPersona` CHAR(8) NULL,
  `tb_tipo_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtb_persona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_detPersona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_detPersona` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_detPersona` (
  `idtb_detPersona` int auto_increment  NOT NULL,
  `tb_persona_idtb_persona` INT NOT NULL,
  `tb_perfil_descripcion` VARCHAR(45) NOT NULL,
  `cuenta` CHAR(10) NULL,
  PRIMARY KEY (`idtb_detPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_cursos` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_cursos` (
  `idtb_cursos` INT auto_increment NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `codigoCurso` CHAR(5) NULL,
  `credito` INT NULL,
  `costo` DOUBLE NULL,
  PRIMARY KEY (`idtb_cursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_oferta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_oferta` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_oferta` (
  `idtb_oferta` INT auto_increment NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `empresa` VARCHAR(45) NULL,
  `sueldo` double NULL,
  PRIMARY KEY (`idtb_oferta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_ofertaCurso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_ofertaCurso` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_ofertaCurso` (
  `idofertacurso` INT auto_increment NOT NULL,
  `curso` VARCHAR(45) NULL,
  `oferta` VARCHAR(45) NULL,
  `tb_oferta_idtb_oferta` INT NOT NULL,
  PRIMARY KEY (`idofertacurso`))
ENGINE = InnoDB;

USE `upc_sistema_control` ;

-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_detCurso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_detCurso` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_detCurso` (
  `idtb_detCurso` INT auto_increment NOT NULL,
  `pesos` DOUBLE NULL,
  `descripcion` VARCHAR(45) NULL,
  `tb_cursos_idtb_cursos` INT NOT NULL,
  PRIMARY KEY (`idtb_detCurso`))
ENGINE = InnoDB;

USE `upc_sistema_control` ;



-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_horarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_horarios` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_horarios` (
  `idtb_horarios` INT auto_increment NOT NULL,
  `fecInicio` DATE NULL,
  `fecFin` DATE NULL,
  `periodo` VARCHAR(10) NULL,
  `nivel` VARCHAR(10) NULL,
  `grado` VARCHAR(10) NULL,
  `tipoHorario` VARCHAR(30) NULL,
  `estado` CHAR(2) NULL,
  PRIMARY KEY (`idtb_horarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_horarioDet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_horarioDet` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_horarioDet` (
  `idtb_horarioDet` INT auto_increment NOT NULL,
  `tb_horarios_idtb_horarios` INT NOT NULL,
  `estado` CHAR(2) NULL,
  `seccion` VARCHAR(45) NULL,
  `curso` VARCHAR(45) NULL,
  `docente` VARCHAR(45) NULL,
  `horaInicio` VARCHAR(10) NULL,
  `horaFin` VARCHAR(10) NULL,
  `dia` VARCHAR(45) NULL,
  `turno` VARCHAR(45) NULL,
  PRIMARY KEY (`idtb_horarioDet`))
ENGINE = InnoDB;

USE `upc_sistema_control` ;


-- -----------------------------------------------------
-- Table `upc_sistema_control`.`tb_cursoRecomendado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upc_sistema_control`.`tb_cursoRecomendado` ;

CREATE TABLE IF NOT EXISTS `upc_sistema_control`.`tb_cursoRecomendado` (
  `idet_curso` INT NOT NULL,
  `puntaje` INT NULL,
  `motivo` VARCHAR(45) NULL,
  `tb_cursos_idtb_cursos` INT NOT NULL,
  PRIMARY KEY (`idet_curso`))
ENGINE = InnoDB;

USE `upc_sistema_control` ;

-- -----------------------------------------------------
-- procedure usp_listadoPerfil
-- -----------------------------------------------------

USE `upc_sistema_control`;
DROP procedure IF EXISTS `upc_sistema_control`.`usp_listadoPerfil`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_listadoPerfil`()
BEGIN

select descripcion from tb_perfil;

END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-----------------------------------------------------------------------
-----------------------------------------------------------------------



select *  from tb_acceso;
insert into tb_acceso values (1,"rcarrast","12345678","72239335","Administrador");
insert into tb_acceso values (2,"palarcov","12345678","72239334","Alumno");
insert into tb_acceso values (3,"afrancor","12345678","72239333","Docente");

select * from tb_perfil;
insert into tb_perfil values (1,"Administrador","SI");
insert into tb_perfil values (2,"Alumno","SI");
insert into tb_perfil values (3,"Docente","SI");

call usp_login("Administrador","rcarrast","12345678");

select c.descripcion, c.codigoCurso, c.costo,d.descripcion, d.pesos, c.credito from tb_cursos c inner join tb_detcurso d
on c.idtb_cursos=d.tb_cursos_idtb_cursos;

select * from tb_detcurso
where tb_cursos_idtb_cursos=2;
desc tb_detcurso;

select * from tb_cursos;

select descripcion,codigoCurso,credito,costo from tb_cursos;

select concat(dniPersona,'-',nombre,' ',apellido) as Dato from tb_persona
where tb_tipo_descripcion='DOCENTE';


insert into tb_persona value (1,"Ronald","Carrasco","M",now(),"SI","ronald@gmail.com","98526314","72258669","Alumno");
insert into tb_persona value (2,"Alisa","Franco","F",now(),"SI","alid@gmail.com","98526314","78258669","Docente");

select * from tb_seccion;

insert into tb_seccion values (1,"SC2R","AULA1","Presencial","SI",2,10);


insert into tb_horarios values (null,?,?,?,now(),null,?,?,?,?,1);
insert into tb_horarios values (1,now(),now(),"202101","Básico","Seccion1","Curso Libre","SI");
insert into tb_horarios values (null,?,?,?,?,?,"Curso Libre","SI");

select * from tb_horarios;

call usp_listarDocenteHorario();

select * from tb_horarioDet;
call usp_listarProgramacionDet(1);
CALL usp_login('Administrador','afrancor','12345678');
select dia,horainicio,horafin,seccion, curso,docente from tb_horarioDet
where idtb_horarioDet =1;


desc tb_horarioDet;

insert into tb_horarioDet values (1,5,'SI',"sec","cur","doc","4","5","Lunes","Mañana");

select * from tb_oferta;

select idofertacurso,curso,oferta from tb_ofertaCurso;
select * from tb_ofertaCurso;


insert into tb_oferta values (1,"Pogramador","Desarrollo de software");
insert into tb_ofertaCurso values (2,"Prueba2","Calidad de software 2",2);


select concat(c.codigoCurso,'-',c.descripcion) as Curso, cr.motivo,cr.puntaje from tb_cursoRecomendado cr inner join tb_cursos c
on cr.tb_cursos_idtb_cursos=c.idtb_cursos;

insert into tb_cursoRecomendado values (1,5,"Muy bueno",1);
insert into tb_cursoRecomendado values (2,3,"Regular",2);
insert into tb_cursoRecomendado values (3,4,"Bueno",3);
insert into tb_cursoRecomendado values (4,1,"Malo",4);

select * from tb_cursos;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--
USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_insert_cursodet`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insert_cursodet`(
   pesos double,descripcion varchar(45),tb_cursos_idtb_cursos int
)
begin
  insert into tb_detcurso value (null,pesos,descripcion,tb_cursos_idtb_cursos);
end$$

DELIMITER ;

--

USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_insert_persona`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insert_persona`(
   nombre varchar(45),apellido varchar(45),sexo char(2),fecha date, correo varchar(45),numero char(11), dni char(8), tipo varchar(45)
)
begin
  insert into tb_persona value (null,nombre,apellido,sexo,fecha,"SI",correo,numero,dni,tipo);
end$$

DELIMITER ;



USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_insert_curso`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insert_curso`(
   nombre varchar(45),codigoCurso varchar(45),credito int,costo double
)
begin
  insert into tb_cursos value (null,nombre,codigoCurso,credito,costo);
end$$

DELIMITER ;

USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_login`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_login`(perf varchar(45), usr varchar(45), pas varchar(45))
BEGIN
select * from tb_acceso where tb_perfil_descripcion=perf and usuario = usr and contraseña = pas;
END$$

DELIMITER ;

USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_ultimoCodigoCurso`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_ultimoCodigoCurso` ()
BEGIN
select MAX(idtb_cursos) from tb_cursos
order by idtb_cursos desc;
END$$

DELIMITER ;

USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_listacurso`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_listacurso` ()
BEGIN
select descripcion,codigoCurso,credito,costo from tb_cursos;
END$$

DELIMITER ;



USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_listacursodet`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_listacursodet` (cod int)
BEGIN
select descripcion, pesos from tb_Detcurso
where tb_cursos_idtb_cursos=cod;
END$$

DELIMITER ;




USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_listacursodet`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_listaPersona` ()
BEGIN
select nombre,apellido,sexo,dniPersona,tb_tipo_descripcion from tb_persona;
END$$

DELIMITER ;

-- --------------------------------------------------------------
-- --------------------------------------------------------------
USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_registrar_seccion`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_registrar_seccion` (codigo varchar(45), nombre varchar(45), tipo varchar(45), cantmin int, cantmax int)
BEGIN
	insert into tb_seccion values (null,codigo,nombre,tipo,"SI",cantmin,cantmax);
END$$

DELIMITER ;

USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_listaseccion`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_listaseccion` ()
BEGIN
select codigoSeccion,seccion,tipoSeccion,cantiMin,cantMax from tb_seccion;
END$$

DELIMITER ;


USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_listarDocenteHorario`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_listarDocenteHorario` ()
BEGIN
select concat(dniPersona,'-',nombre,' ',apellido) as Dato from tb_persona
where tb_tipo_descripcion='DOCENTE';
END$$

DELIMITER ;


USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_listarNombreSeccion`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_listarNombreSeccion` ()
BEGIN
select concat(codigoSeccion,'-',seccion,'-',tipoSeccion) as nombreSeccion from tb_seccion;
END$$

DELIMITER ;



USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_listarNombreCursos`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_listarNombreCursos` ()
BEGIN
select concat(codigoCurso,'-',descripcion) as Nombrecurso from tb_cursos;
END$$

DELIMITER ;



USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_obtenerultimocodigohorario`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_obtenerultimocodigohorario` ()
BEGIN
select idtb_horarios from  tb_horarios
order by idtb_horarios desc;
END$$

DELIMITER ;

USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_listaprogramacionhorario`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_listaprogramacionhorario`(tipo varchar(45))
begin
select h.idtb_horarios,h.tipoHorario,h.nivel,h.grado,h.periodo,h.fecinicio,fecFin
       from tb_horarios h
where h.tipoHorario =tipo
order by h.idtb_horarios asc;
end;$$

DELIMITER ;

USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_listarProgramacionDet`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_listarProgramacionDet` (horario int)
BEGIN
select dia,horainicio,horafin,seccion, curso,docente from tb_horarioDet
where idtb_horarioDet =1;
END$$

DELIMITER ;


USE `upc_sistema_control`;
DROP procedure IF EXISTS `usp_insertar_oferta`;

DELIMITER $$
USE `upc_sistema_control`$$
CREATE PROCEDURE `usp_insertar_oferta` (descri varchar(45),empre varchar(45), sueldo double)
BEGIN
insert into tb_oferta values (null, null,descri,empre,sueldo);
END$$

DELIMITER ;
