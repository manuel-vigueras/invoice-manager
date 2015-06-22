package com.mx.sivale.actions;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.mx.sivale.service.impl.FacturaService;
import com.mx.sivale.to.FacturaTO;
import com.mx.sivale.to.UsuarioTO;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage(value = "json-default")
@Namespace("/")
public class FacturaAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5800895933633305249L;

	@Autowired
	FacturaService facturaService;

	private String usuarioSeleccionado;
	private String periodoSeleccionado;
	private List<FacturaTO> listaFacturas;

	@Action(value = "allFacturasAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"listaFacturas", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String getAllFacturas() {

		listaFacturas = facturaService.getAllFacturas();

		return SUCCESS;
	}

	@Action(value = "facturasByUserAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"listaFacturas", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String getFacturasByUsuario() {

		UsuarioTO user = new UsuarioTO();

		user.setNombre(usuarioSeleccionado);

		listaFacturas = facturaService.getFacturasByUsuario(user);

		return SUCCESS;
	}

	@Action(value = "facturasVinculadasAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"listaFacturas", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String getFacturasVinculadas() {

		listaFacturas = facturaService.getFacturasVinculadas();

		return SUCCESS;
	}

	@Action(value = "facturasVinculadasPeriodoAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"listaFacturas", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String getFacturasVinculadasByPeriodo() {

		listaFacturas = facturaService
				.getFacturasVinculadasByPeriodo(periodoSeleccionado);

		return SUCCESS;
	}

	// GETTERS AND SETTERS

	public List<FacturaTO> getListaFacturas() {
		return listaFacturas;
	}

	public void setListaFacturas(List<FacturaTO> listaFacturas) {
		this.listaFacturas = listaFacturas;
	}

	public String getUsuarioSeleccionado() {
		return usuarioSeleccionado;
	}

	public void setUsuarioSeleccionado(String usuarioSeleccionado) {
		this.usuarioSeleccionado = usuarioSeleccionado;
	}

	public String getPeriodoSeleccionado() {
		return periodoSeleccionado;
	}

	public void setPeriodoSeleccionado(String periodoSeleccionado) {
		this.periodoSeleccionado = periodoSeleccionado;
	}

}
