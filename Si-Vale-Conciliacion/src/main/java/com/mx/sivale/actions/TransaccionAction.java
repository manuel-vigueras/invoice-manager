package com.mx.sivale.actions;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.mx.sivale.service.TransaccionService;
import com.mx.sivale.to.TransaccionTO;
import com.mx.sivale.to.UsuarioTO;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage(value = "json-default")
@Namespace("/")
public class TransaccionAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7401765965191230886L;

	@Autowired
	TransaccionService transaccionService;

	private List<TransaccionTO> listaTransacciones;
	private String usuarioSeleccionado;
	private String justificanteSeleccionado;
	private String periodoSeleccionado;

	@Action(value = "allTransaccionesAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"listaTransacciones", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String getAllTransacciones() {

		listaTransacciones = transaccionService.getAllTransacciones();

		return SUCCESS;
	}

	@Action(value = "transaccionesByUserAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"listaTransacciones", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String getTransaccionesByUser() {

		UsuarioTO usuarioTO = new UsuarioTO();

		usuarioTO.setNombre(usuarioSeleccionado);

		listaTransacciones = transaccionService
				.getTransaccionesByUsuario(usuarioTO);

		return SUCCESS;
	}

	@Action(value = "transaccionesByJustificanteAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"listaTransacciones", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String getTransaccionesByJustificante() {

		listaTransacciones = transaccionService
				.getTransaccionesByJustificante(justificanteSeleccionado);

		return SUCCESS;
	}

	@Action(value = "transaccionesByPeriodoAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"listaTransacciones", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String getTransaccionesByPeriodo() {

		listaTransacciones = transaccionService
				.getTransaccionesByPeriodo(periodoSeleccionado);

		return SUCCESS;
	}

	// GETTERS AND SETTERS
	public List<TransaccionTO> getListaTransacciones() {
		return listaTransacciones;
	}

	public void setListaTransacciones(List<TransaccionTO> listaTransacciones) {
		this.listaTransacciones = listaTransacciones;
	}

	public String getUsuarioSeleccionado() {
		return usuarioSeleccionado;
	}

	public void setUsuarioSeleccionado(String usuarioSeleccionado) {
		this.usuarioSeleccionado = usuarioSeleccionado;
	}

	public String getJustificanteSeleccionado() {
		return justificanteSeleccionado;
	}

	public void setJustificanteSeleccionado(String justificanteSeleccionado) {
		this.justificanteSeleccionado = justificanteSeleccionado;
	}

	public String getPeriodoSeleccionado() {
		return periodoSeleccionado;
	}

	public void setPeriodoSeleccionado(String periodoSeleccionado) {
		this.periodoSeleccionado = periodoSeleccionado;
	}
}
