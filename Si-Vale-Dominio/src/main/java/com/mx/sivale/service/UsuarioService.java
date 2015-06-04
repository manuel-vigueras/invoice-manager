package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.UsuarioTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface UsuarioService {
	
	public void insert(UsuarioTO usuarioTO);

	public void update(UsuarioTO usuarioTO);

	public void delete(UsuarioTO usuarioTO);

	public List<UsuarioTO> getAll();
	

}
