package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.CategoriaDAO;
import com.mx.sivale.to.CategoriaTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class CategoriaDAOImpl extends GenericDAOImpl<CategoriaTO, Long> implements CategoriaDAO {

	public CategoriaDAOImpl() {
		super(CategoriaTO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(CategoriaTO categoriaTO) {
		// TODO Auto-generated method stub
		guardar(categoriaTO);
	}

	public void update(CategoriaTO categoriaTO) {
		// TODO Auto-generated method stub
		actualizar(categoriaTO);
	}

	public void delete(CategoriaTO categoriaTO) {
		// TODO Auto-generated method stub
		borrar(categoriaTO);
	}

	public List<CategoriaTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
