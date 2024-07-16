TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER EstablecerFechasCreacionCentro\nBEFORE INSERT ON centro_deportivo\nFOR EACH ROW\nBEGIN\n    SET NEW.Fecha_Creacion = NOW();\n    SET NEW.Fecha_Actualizacion = NOW();\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_general_ci'
db_cl_names='utf8mb4_general_ci'
created=1720736216725287
