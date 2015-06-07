package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.SupervisorDAO;
import com.mx.sivale.to.SupervisorTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class SupervisorDAOImpl extends GenericDAOImpl<SupervisorTO, Long> implements SupervisorDAO{

	public SupervisorDAOImpl() {
		super(SupervisorTO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(SupervisorTO supervisorTO) {
		// TODO Auto-generated method stub
		guardar(supervisorTO);
	}

	public void update(SupervisorTO supervisorTO) {
		// TODO Auto-generated method stub
		actualizar(supervisorTO);
	}

	public void delete(SupervisorTO supervisorTO) {
		// TODO Auto-generated method stub
		borrar(supervisorTO);
	}

	public List<SupervisorTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
