package com.mx.sivale.dao;

import java.util.List;
import java.util.Map;

import com.mx.sivale.to.UsuarioTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface UsuarioDAO {

	public Map<String, Object> exists(String user, String passw); 
	
	public void insert(UsuarioTO usuarioTO);

	public void update(UsuarioTO usuarioTO);

	public void delete(UsuarioTO usuarioTO);

	public List<UsuarioTO> getAll();

}
