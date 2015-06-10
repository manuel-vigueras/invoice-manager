package com.mx.sivale.service.impl;

import java.util.List;

import com.mx.sivale.to.FacturaTO;
import com.mx.sivale.to.UsuarioTO;

public interface FacturaService {

	public List<FacturaTO> getAllFacturas();

	public List<FacturaTO> getFacturasByUsuario(UsuarioTO usuarioTO);
	
	public List<FacturaTO> getFacturasConciliadas(); 
	
	public List<FacturaTO> getFacturasConciliadasByPeriodo(String periodo); 

}
