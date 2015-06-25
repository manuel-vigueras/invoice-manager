package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.CatalogoTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface CatalogosService {
	
	public void insert(CatalogoTO catalogoTO);

	public void update(CatalogoTO catalogoTO);

	public void delete(CatalogoTO catalogoTO);

	public List<CatalogoTO> getAll();

}
