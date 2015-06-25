package com.mx.sivale.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mx.sivale.dao.GenericDAO;

public class GenericDAOImpl<T, ID extends Serializable> extends
		HibernateDaoSupport implements GenericDAO<T, ID> {

	@Autowired
	public void anyMethodName(SessionFactory sessionFactory) {
		setSessionFactory(sessionFactory);
	}

	protected Class<T> c;

	public GenericDAOImpl(Class<T> c) {
		this.c = c;
	}

	private boolean checkNull(T vo) {
		return vo != null;
	}

	public void guardar(T vo) {
		if (checkNull(vo))
			getHibernateTemplate().save(vo);
	}

	public void actualizar(T vo) {
		if (checkNull(vo))
			getHibernateTemplate().update(vo);
	}

	public void borrar(T vo) {
		if (checkNull(vo))
			getHibernateTemplate().delete(vo);
	}

	public List<T> buscar() {
		return getHibernateTemplate().loadAll(c);
	}
}