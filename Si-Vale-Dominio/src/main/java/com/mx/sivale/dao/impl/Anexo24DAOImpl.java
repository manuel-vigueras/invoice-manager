package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.Anexo24DAO;
import com.mx.sivale.to.Anexo24TO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class Anexo24DAOImpl extends GenericDAOImpl<Anexo24TO, Long> implements Anexo24DAO {

	public Anexo24DAOImpl() {
		super(Anexo24TO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(Anexo24TO anexo24to) {
		// TODO Auto-generated method stub
		guardar(anexo24to);
		
	}

	public void update(Anexo24TO anexo24to) {
		// TODO Auto-generated method stub
		actualizar(anexo24to);
	}

	public void delete(Anexo24TO anexo24to) {
		// TODO Auto-generated method stub
		borrar(anexo24to);
	}

	public List<Anexo24TO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
