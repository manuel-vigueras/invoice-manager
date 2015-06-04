package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.SupervisorTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface SupervisorService {
	
	public void insert(SupervisorTO supervisorTO);

	public void update(SupervisorTO supervisorTO);

	public void delete(SupervisorTO supervisorTO);

	public List<SupervisorTO> getAll();

}
