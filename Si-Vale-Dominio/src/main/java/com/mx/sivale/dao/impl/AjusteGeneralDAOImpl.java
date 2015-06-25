package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.AjusteGeneralDAO;
import com.mx.sivale.to.AjusteGeneralTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class AjusteGeneralDAOImpl extends GenericDAOImpl<AjusteGeneralTO, Long>
		implements AjusteGeneralDAO {

	public AjusteGeneralDAOImpl() {
		super(AjusteGeneralTO.class);
	}

	public void insert(AjusteGeneralTO ajusteGeneralTO) {
		// TODO Auto-generated method stub
		guardar(ajusteGeneralTO);

	}

	public void update(AjusteGeneralTO ajusteGeneralTO) {
		// TODO Auto-generated method stub
		actualizar(ajusteGeneralTO);
	}

	public void delete(AjusteGeneralTO ajusteGeneralTO) {
		// TODO Auto-generated method stub
		borrar(ajusteGeneralTO);
	}

	public List<AjusteGeneralTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
