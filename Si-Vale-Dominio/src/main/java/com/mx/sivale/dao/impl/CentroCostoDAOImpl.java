package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.CentroCostoDAO;
import com.mx.sivale.to.CentroCostoTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class CentroCostoDAOImpl extends GenericDAOImpl<CentroCostoTO, Long> implements CentroCostoDAO{

	public CentroCostoDAOImpl() {
		super(CentroCostoTO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(CentroCostoTO centroCostoTO) {
		// TODO Auto-generated method stub
		guardar(centroCostoTO);
	}

	public void update(CentroCostoTO centroCostoTO) {
		// TODO Auto-generated method stub
		actualizar(centroCostoTO);
	}

	public void delete(CentroCostoTO centroCostoTO) {
		// TODO Auto-generated method stub
		borrar(centroCostoTO);
	}

	public List<CentroCostoTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
