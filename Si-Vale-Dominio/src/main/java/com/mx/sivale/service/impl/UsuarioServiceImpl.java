package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.UsuarioDAO;
import com.mx.sivale.service.UsuarioService;
import com.mx.sivale.to.UsuarioTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	UsuarioDAO usuarioDAO;

	public void insert(UsuarioTO usuarioTO) {
		// TODO Auto-generated method stub
		usuarioDAO.insert(usuarioTO);
	}

	public void update(UsuarioTO usuarioTO) {
		// TODO Auto-generated method stub
		usuarioDAO.update(usuarioTO);
	}

	public void delete(UsuarioTO usuarioTO) {
		// TODO Auto-generated method stub
		usuarioDAO.delete(usuarioTO);
	}

	public List<UsuarioTO> getAll() {
		// TODO Auto-generated method stub
		return usuarioDAO.getAll();
	}
}
