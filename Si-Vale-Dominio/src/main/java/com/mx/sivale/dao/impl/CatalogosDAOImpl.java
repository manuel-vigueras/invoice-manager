package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.CatalogosDAO;
import com.mx.sivale.to.CatalogoTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class CatalogosDAOImpl extends GenericDAOImpl<CatalogoTO, Long> implements CatalogosDAO{

	public CatalogosDAOImpl() {
		super(CatalogoTO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(CatalogoTO catalogoTO) {
		// TODO Auto-generated method stub
		guardar(catalogoTO);
		
	}

	public void update(CatalogoTO catalogoTO) {
		// TODO Auto-generated method stub
		actualizar(catalogoTO);
	}

	public void delete(CatalogoTO catalogoTO) {
		// TODO Auto-generated method stub
		borrar(catalogoTO);
	}

	public List<CatalogoTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}
	
	

}
