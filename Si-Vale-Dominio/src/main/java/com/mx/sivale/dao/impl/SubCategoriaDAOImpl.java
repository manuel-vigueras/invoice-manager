package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.SubCategoriaDAO;
import com.mx.sivale.to.SubCategoriaTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class SubCategoriaDAOImpl extends GenericDAOImpl<SubCategoriaTO, Long>
		implements SubCategoriaDAO {

	public SubCategoriaDAOImpl() {
		super(SubCategoriaTO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(SubCategoriaTO subCategoriaTO) {
		// TODO Auto-generated method stub
		guardar(subCategoriaTO);
	}

	public void update(SubCategoriaTO subCategoriaTO) {
		// TODO Auto-generated method stub
		actualizar(subCategoriaTO);
	}

	public void delete(SubCategoriaTO subCategoriaTO) {
		// TODO Auto-generated method stub
		borrar(subCategoriaTO);
	}

	public List<SubCategoriaTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
