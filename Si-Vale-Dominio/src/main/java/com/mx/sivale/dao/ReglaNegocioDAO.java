package com.mx.sivale.dao;

import java.util.List;

import com.mx.sivale.to.ReglaNegocioTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface ReglaNegocioDAO {
	
	public void insert(ReglaNegocioTO reglaNegocioTO);

	public void update(ReglaNegocioTO reglaNegocioTO);

	public void delete(ReglaNegocioTO reglaNegocioTO);

	public List<ReglaNegocioTO> getAll();

}
