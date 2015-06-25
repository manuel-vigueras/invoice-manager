package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.SupervisorDAO;
import com.mx.sivale.service.SupervisorService;
import com.mx.sivale.to.SupervisorTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class SupervisorServiceImpl implements SupervisorService {

	@Autowired
	SupervisorDAO supervisorDAO;

	public void insert(SupervisorTO supervisorTO) {
		// TODO Auto-generated method stub
		supervisorDAO.insert(supervisorTO);
	}

	public void update(SupervisorTO supervisorTO) {
		// TODO Auto-generated method stub
		supervisorDAO.update(supervisorTO);
	}

	public void delete(SupervisorTO supervisorTO) {
		// TODO Auto-generated method stub
		supervisorDAO.delete(supervisorTO);
	}

	public List<SupervisorTO> getAll() {
		// TODO Auto-generated method stub
		return supervisorDAO.getAll();
	}

}
