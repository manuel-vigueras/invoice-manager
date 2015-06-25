package com.mx.sivale.dao;

import java.util.List;

public interface GenericDAO<T, ID>  {
	
	public void guardar(final T vo);
	
	public void actualizar(final T vo);
	
	public void borrar(final T vo);
	
	public List<T> buscar();

}
