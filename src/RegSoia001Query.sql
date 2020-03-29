SELECT rs.PATENTE, rs.ADUANA,rs.NUMDCTO,rs.RFC,rs.IDPREV,rs.FECHA,rs.hora,rs.CVE_DCTO,rs.TIPO_OPER,rs.ESTADO,rs.SUBESTADO,rs.SECUENCIA,rs.FACTURA,rs.cantidad,rs.VALOR,rs.PATENTE_ANT,rs.ADUANA_ANT,rs.NUMDCTO_ANT,rs.archivo ;
		 ,d_usuario, d_directorio as directorio ;
		 from ;
		 ( ;
		 select rs.PATENTE, rs.ADUANA,rs.NUMDCTO,rs.RFC,rs.IDPREV,rs.FECHA,rs.hora,rs.CVE_DCTO,rs.TIPO_OPER,rs.ESTADO,rs.SUBESTADO,rs.SECUENCIA,rs.FACTURA,rs.cantidad,rs.VALOR,rs.PATENTE_ANT,rs.ADUANA_ANT,rs.NUMDCTO_ANT,rs.archivo from reportes.reg_soia as rs ;
		 WHERE TRUE AND rs.FECHA BETWEEN '"+fechaInio+"' AND '"+fechaFin+"' ) rs ;
		 RIGHT JOIN ;
		( ;
			SELECT arc.archivo,arc.juliano,arc.year,arc.ftp,arc.estado  FROM reportes.arc_soia as arc WHERE TRUE  AND arc.estado !=0  and arc.year='2019'  ;
		 ) arc ;
		 ON(rs.archivo =arc.archivo) ;
		 INNER JOIN reportes.detalles d ;
		 ON rs.NUMDCTO=d.pedimento AND rs.PATENTE= d.patente AND rs.aduana = d.aduana and year(fecha_validacion)=2019 AND d.fecha_validacion BETWEEN '"+fechaInio+"' AND '"+fechaFin+"' AND d.usuario in ('usuario','usuario') ;
		 INNER JOIN(SELECT u.d_directorio, u.d_usuario,u.c_cliente FROM saai.cs_usuario as u WHERE u.b_ftp='1' AND u.b_activo='1' ) as u  ;
		 ON(d.usuario=u.d_usuario) ;
		 GROUP BY u.d_usuario,u.d_directorio,rs.PATENTE, rs.ADUANA,rs.NUMDCTO,rs.RFC,rs.IDPREV,rs.FECHA,rs.hora,rs.CVE_DCTO,rs.TIPO_OPER,rs.ESTADO,rs.SUBESTADO,rs.SECUENCIA,rs.FACTURA,rs.cantidad,rs.VALOR,rs.PATENTE_ANT,rs.ADUANA_ANT,rs.NUMDCTO_ANT,rs.archivo ;
		 UNION ;  
		 SELECT rs.PATENTE, rs.ADUANA,rs.NUMDCTO,rs.RFC,rs.IDPREV,rs.FECHA,rs.hora,rs.CVE_DCTO,rs.TIPO_OPER,rs.ESTADO,rs.SUBESTADO,rs.SECUENCIA,rs.FACTURA,rs.cantidad,rs.VALOR,rs.PATENTE_ANT,rs.ADUANA_ANT,rs.NUMDCTO_ANT,rs.archivo ; 
		 ,d_usuario, d_directorio_sftp   as directorio ;
		 from 
		 ( 
		 select rs.PATENTE, rs.ADUANA,rs.NUMDCTO,rs.RFC,rs.IDPREV,rs.FECHA,rs.hora,rs.CVE_DCTO,rs.TIPO_OPER,rs.ESTADO,rs.SUBESTADO,rs.SECUENCIA,rs.FACTURA,rs.cantidad,rs.VALOR,rs.PATENTE_ANT,rs.ADUANA_ANT,rs.NUMDCTO_ANT,rs.archivo from reportes.reg_soia  
		as rs  
		 WHERE TRUE AND rs.FECHA BETWEEN '"+fechaInio+"' AND '"+fechaFin+"' ) rs  
		 RIGHT JOIN 
		( 
		 SELECT arc.archivo,arc.juliano,arc.year,arc.ftp,arc.estado  FROM reportes.arc_soia as arc WHERE TRUE  AND arc.estado !=0  and arc.year='2019'   
		 ) arc  
		 ON(rs.archivo =arc.archivo) 
		 INNER JOIN reportes.detalles d  
		 ON rs.NUMDCTO=d.pedimento AND rs.PATENTE= d.patente AND rs.aduana = d.aduana and year(fecha_validacion)=2019 AND d.fecha_validacion BETWEEN '"+fechaInio+"' AND '"+fechaFin+"' AND d.usuario in ('usuario','usuario')  
			INNER JOIN(SELECT u.d_directorio_sftp, u.d_usuario,u.c_cliente FROM saai.cs_usuario as u WHERE u.b_sftp='1' AND u.b_activo='1' ) as u  
		 ON(d.usuario=u.d_usuario) 
		 GROUP BY u.d_usuario,u.d_directorio_sftp,rs.PATENTE, rs.ADUANA,rs.NUMDCTO,rs.RFC,rs.IDPREV,rs.FECHA,rs.hora,rs.CVE_DCTO,rs.TIPO_OPER,rs.ESTADO,rs.SUBESTADO,rs.SECUENCIA,rs.FACTURA,rs.cantidad,rs.VALOR,rs.PATENTE_ANT,rs.ADUANA_ANT,rs.NUMDCTO_ANT,rs.archivo;