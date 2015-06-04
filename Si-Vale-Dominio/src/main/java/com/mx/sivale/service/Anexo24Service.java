package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.Anexo24TO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface Anexo24Service {
	
	public void insert(Anexo24TO anexo24TO);

	public void update(Anexo24TO anexo24TO);

	public void delete(Anexo24TO anexo24TO);

	public List<Anexo24TO> getAll();

}
