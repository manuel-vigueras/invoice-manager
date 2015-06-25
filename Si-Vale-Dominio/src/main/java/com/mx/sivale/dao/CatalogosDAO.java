package com.mx.sivale.dao;

import java.util.List;

import com.mx.sivale.to.CatalogoTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface CatalogosDAO {
	
	public void insert(CatalogoTO catalogoTO);

	public void update(CatalogoTO catalogoTO);

	public void delete(CatalogoTO catalogoTO);

	public List<CatalogoTO> getAll();

}
