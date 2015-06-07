package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.UsuarioDAO;
import com.mx.sivale.to.UsuarioTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class UsuarioDAOImpl extends GenericDAOImpl<UsuarioTO, Long> implements
		UsuarioDAO {

	public UsuarioDAOImpl() {
		super(UsuarioTO.class);
	}

	public void insert(UsuarioTO usuarioTO) {
		// TODO Auto-generated method stub
		guardar(usuarioTO);
	}

	public void update(UsuarioTO usuarioTO) {
		// TODO Auto-generated method stub
		actualizar(usuarioTO);
	}

	public void delete(UsuarioTO usuarioTO) {
		// TODO Auto-generated method stub
		borrar(usuarioTO);
	}

	public List<UsuarioTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}
}
