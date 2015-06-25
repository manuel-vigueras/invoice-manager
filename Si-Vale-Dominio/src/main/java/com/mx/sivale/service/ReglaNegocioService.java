package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.ReglaNegocioTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface ReglaNegocioService {
	
	public void insert(ReglaNegocioTO reglaNegocioTO);

	public void update(ReglaNegocioTO reglaNegocioTO);

	public void delete(ReglaNegocioTO reglaNegocioTO);

	public List<ReglaNegocioTO> getAll();

}
