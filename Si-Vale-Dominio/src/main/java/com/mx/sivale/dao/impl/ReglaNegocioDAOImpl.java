package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.ReglaNegocioDAO;
import com.mx.sivale.to.ReglaNegocioTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class ReglaNegocioDAOImpl extends GenericDAOImpl<ReglaNegocioTO, Long>
		implements ReglaNegocioDAO {

	public ReglaNegocioDAOImpl() {
		super(ReglaNegocioTO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(ReglaNegocioTO reglaNegocioTO) {
		// TODO Auto-generated method stub
		guardar(reglaNegocioTO);
	}

	public void update(ReglaNegocioTO reglaNegocioTO) {
		// TODO Auto-generated method stub
		actualizar(reglaNegocioTO);
	}

	public void delete(ReglaNegocioTO reglaNegocioTO) {
		// TODO Auto-generated method stub
		borrar(reglaNegocioTO);
	}

	public List<ReglaNegocioTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
