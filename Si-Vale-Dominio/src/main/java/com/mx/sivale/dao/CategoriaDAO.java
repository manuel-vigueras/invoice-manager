package com.mx.sivale.dao;

import java.util.List;

import com.mx.sivale.to.CategoriaTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface CategoriaDAO {
	
	public void insert(CategoriaTO categoriaTO);

	public void update(CategoriaTO categoriaTO);

	public void delete(CategoriaTO categoriaTO);

	public List<CategoriaTO> getAll();

}
