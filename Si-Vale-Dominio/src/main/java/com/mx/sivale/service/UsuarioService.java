package com.mx.sivale.service;

import java.util.List;
import java.util.Map;

import com.mx.sivale.to.UsuarioTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface UsuarioService {
	
	public Map<String, Object> exists(String user, String passw); 
	
	public void insert(UsuarioTO usuarioTO);

	public void update(UsuarioTO usuarioTO);

	public void delete(UsuarioTO usuarioTO);

	public List<UsuarioTO> getAll();
	
	public List<UsuarioTO> getAllByAdmin(int idAdmin);
	
}
