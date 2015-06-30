package com.mx.sivale.service.impl;

import java.util.ArrayList;
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

	
	public String exists(String user, String passw) {
		
		return usuarioDAO.exists(user, passw); 
	}
	
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

	public List<UsuarioTO> getAllByAdmin(int idAdmin) {

		List<UsuarioTO> listaUsuarios = new ArrayList<UsuarioTO>();

		UsuarioTO usuarioTO = new UsuarioTO();
		usuarioTO.setId(1);
		usuarioTO.setNombre("Alfonso López Alcántara");
		usuarioTO.setIdUser("2364001538164532");
		listaUsuarios.add(usuarioTO);

		usuarioTO = new UsuarioTO();
		usuarioTO.setId(2);
		usuarioTO.setNombre("David Gutiérrez Hernández");
		usuarioTO.setIdUser("2364001538876234");
		listaUsuarios.add(usuarioTO);

		usuarioTO = new UsuarioTO();
		usuarioTO.setId(3);
		usuarioTO.setNombre("Antonio Cortés Zamora");
		usuarioTO.setIdUser("2364001538167285");
		listaUsuarios.add(usuarioTO);

		usuarioTO = new UsuarioTO();
		usuarioTO.setId(4);
		usuarioTO.setNombre("Mariana Ramírez Cantú");
		usuarioTO.setIdUser("2364001538145683");
		listaUsuarios.add(usuarioTO);

		return listaUsuarios;
	}
}
