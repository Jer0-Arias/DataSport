TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER VerificarStockAntesVenta\nBEFORE INSERT ON VENTA\nFOR EACH ROW\nBEGIN\n    DECLARE StockActual INT;\n    SELECT Stock INTO StockActual FROM Producto WHERE Id_Producto = NEW.ID_Producto;\n\n    IF StockActual < NEW.Cantidad THEN\n        SIGNAL SQLSTATE \'45000\' SET MESSAGE_TEXT = \'Stock insuficiente para la venta\';\n    END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER ActualizarStockProducto\nAFTER INSERT ON VENTA\nFOR EACH ROW\nBEGIN\n    UPDATE Producto\n    SET Stock = Stock - NEW.Cantidad\n    WHERE Id_Producto = NEW.ID_Producto;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER ActualizarEstadoMembresia\nAFTER INSERT ON VENTA\nFOR EACH ROW\nBEGIN\n    UPDATE Membresia\n    SET tipo = \'ACTIVO\', fecha_inicio = CURDATE(), fecha_fin = DATE_ADD(CURDATE(), INTERVAL 1 YEAR)\n    WHERE Id_Usuario = NEW.Id_Usuario;\nEND'
sql_modes=1098907648 1098907648 1098907648
definers='root@localhost' 'root@localhost' 'root@localhost'
client_cs_names='utf8mb4' 'utf8mb4' 'utf8mb4'
connection_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci' 'utf8mb4_general_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci' 'utf8mb4_general_ci'
created=1720736216652597 1720736216633616 1720736216673795
