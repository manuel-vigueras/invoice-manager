package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.PerfilDAO;
import com.mx.sivale.to.PerfilTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class PerfilDAOImpl extends GenericDAOImpl<PerfilTO, Long> implements
		PerfilDAO {

	public PerfilDAOImpl() {
		super(PerfilTO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(PerfilTO perfilTO) {
		// TODO Auto-generated method stub
		guardar(perfilTO);
	}

	public void update(PerfilTO perfilTO) {
		// TODO Auto-generated method stub
		actualizar(perfilTO);
	}

	public void delete(PerfilTO perfilTO) {
		// TODO Auto-generated method stub
		borrar(perfilTO);
	}

	public List<PerfilTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
