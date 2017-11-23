package com.swaca.util;

public class Triggers {
/*
 * 
 * TRIGGER INSERT LOG
delimiter |
CREATE TRIGGER LOGUPDATE
AFTER UPDATE ON detalle_solicitud_compra
FOR EACH ROW
BEGIN
	DECLARE accionCantidad VARCHAR(200);
    DECLARE CantidadRegistrada VARCHAR(200);
    DECLARE CantidadFaltante VARCHAR(200);
	DECLARE mensaje VARCHAR(200);
	
    IF new.cantidad <> old.cantidad
    THEN 
		if(new.cantidad > old.cantidad) THEN 
			set accionCantidad := new.cantidad - old.cantidad;
			set mensaje :=CONCAT("Se aumento la CANTIDAD PEDIDA en : ",accionCantidad);
			INSERT INTO logoperaciones (cantidad,date,log,descripcion,cantidad_actual) 
			values (new.cantidad,NOW(),old.id_detalle_solicitud_compra,mensaje,old.cantidad_registrada);        
		ELSE 
			set accionCantidad := old.cantidad - new.cantidad;
			set mensaje :=CONCAT("Se disminuyo la CANTIDAD PEDIDA en : ",accionCantidad);
			INSERT INTO logoperaciones (cantidad,date,log,descripcion,cantidad_actual) 
			values (new.cantidad,NOW(),old.id_detalle_solicitud_compra,mensaje,old.cantidad_registrada);    
		END IF;	
    END IF;
    
    IF old.cantidad_registrada <> new.cantidad_registrada
    THEN
			if(new.cantidad_registrada > old.cantidad_registrada) THEN
			   set CantidadRegistrada := new.cantidad_registrada - old.cantidad_registrada;
               set CantidadFaltante := old.cantidad - new.cantidad_registrada;
			   set mensaje :=CONCAT("Se registro la LLEGADA de ",CantidadRegistrada," UNIDADES al almacén FALTANDO ",CantidadFaltante," para completar el TOTAL de : ",old.cantidad);
			   INSERT INTO logoperaciones (cantidad,date,log,descripcion,cantidad_actual) 
			   values (old.cantidad,NOW(),old.id_detalle_solicitud_compra,mensaje,new.cantidad_registrada);   
			ELSE
			   set CantidadRegistrada := old.cantidad_registrada - new.cantidad_registrada;
               set CantidadFaltante := old.cantidad - new.cantidad_registrada;
			   set mensaje :=CONCAT("Se REDUCIO la cantidad de LLEGADA en ",CantidadRegistrada," UNIDADES al almacén FALTANDO ",CantidadFaltante," para completar el TOTAL de : ",old.cantidad);
			   INSERT INTO logoperaciones (cantidad,date,log,descripcion,cantidad_actual) 
			   values (old.cantidad,NOW(),old.id_detalle_solicitud_compra,mensaje,new.cantidad_registrada); 
			END IF;
		END IF;
	END
|
DELIMITER ;
********************************************************************************************************************************
TRIGGER UPDATE ESTADO CUANDO LLEGA A SU TOTAL 

delimiter |
CREATE TRIGGER LOGUPDATE_ESTADO
BEFORE UPDATE ON detalle_solicitud_compra
FOR EACH ROW
BEGIN
    DECLARE idSolicitud INT;
	IF ( old.cantidad = new.cantidad_registrada AND old.estado_detalle = 4) THEN
	set new.estado_detalle= 5;
    ELSEIF (old.estado_detalle = 4 AND old.cantidad > new.cantidad_registrada ) THEN
    set new.estado_detalle= 4;
    ELSEIF (old.estado_detalle = 5 AND old.cantidad > new.cantidad_registrada) THEN
    set new.estado_detalle= 4;
    END IF;
	IF ( new.estado_detalle = 2) THEN
    SET idSolicitud := old.id_solicitud_compra;
    UPDATE solicitud_compra set estado_solicitud_compra = 2 WHERE id_solicitud_compra=idSolicitud;
    END IF;
END
|
DELIMITER ;
 * 
 ********************************************************************************************************************************
 *
 *
 *CREATE TRIGGER `UPDATE_ANULADO_CASCADA_SC` BEFORE UPDATE ON `solicitud_compra`
 FOR EACH ROW BEGIN 
IF(NEW.estado_solicitud_compra = 3)THEN
UPDATE detalle_solicitud_compra set estado_detalle = 7 where id_solicitud_compra=old.id_solicitud_compra;
END IF;
END 
 */
}
