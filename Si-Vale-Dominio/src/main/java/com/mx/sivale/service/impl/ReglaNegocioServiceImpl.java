package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.ReglaNegocioDAO;
import com.mx.sivale.service.ReglaNegocioService;
import com.mx.sivale.to.ReglaNegocioTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class ReglaNegocioServiceImpl implements ReglaNegocioService {

	@Autowired
	ReglaNegocioDAO reglaNegocioDAO;

	public void insert(ReglaNegocioTO reglaNegocioTO) {
		// TODO Auto-generated method stub
		reglaNegocioDAO.insert(reglaNegocioTO);
	}

	public void update(ReglaNegocioTO reglaNegocioTO) {
		// TODO Auto-generated method stub
		reglaNegocioDAO.update(reglaNegocioTO);
	}

	public void delete(ReglaNegocioTO reglaNegocioTO) {
		// TODO Auto-generated method stub
		reglaNegocioDAO.delete(reglaNegocioTO);
	}

	public List<ReglaNegocioTO> getAll() {
		// TODO Auto-generated method stub
		return reglaNegocioDAO.getAll();
	}

}
