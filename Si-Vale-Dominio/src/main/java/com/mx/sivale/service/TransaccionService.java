package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.TransaccionTO;
import com.mx.sivale.to.UsuarioTO;

public interface TransaccionService {
	
	public List<TransaccionTO> getAllTransacciones();
	
	public List<TransaccionTO> getTransaccionesByUsuario(UsuarioTO usuarioTO);
	
	public List<TransaccionTO> getTransaccionesByJustificante(String justificante);
	
	public List<TransaccionTO> getTransaccionesByPeriodo(String periodo);

}
