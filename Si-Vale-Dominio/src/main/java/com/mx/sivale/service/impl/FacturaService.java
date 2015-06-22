package com.mx.sivale.service.impl;

import java.util.List;

import com.mx.sivale.to.FacturaTO;
import com.mx.sivale.to.UsuarioTO;

public interface FacturaService {

	public List<FacturaTO> getAllFacturas();

	public List<FacturaTO> getFacturasByUsuario(UsuarioTO usuarioTO);
	
	public List<FacturaTO> getFacturasVinculadas(); 
	
	public List<FacturaTO> getFacturasVinculadasByPeriodo(String periodo); 
	
	public FacturaTO getFacturaByFolio(String folio);
	
	public List<FacturaTO> getFacturasNoVinculadas(); 

}
