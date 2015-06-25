package com.mx.sivale.actions;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
public class RedirectMenuAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2298302537930018713L;

	@Action(value = "resumenAction", results = {
			@Result(name = SUCCESS, location = "/secured/resumen.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String redirectResumenAction() throws Exception {

		return SUCCESS;

	}
	
	@Action(value = "transaccionesAction", results = {
			@Result(name = SUCCESS, location = "/secured/transacciones.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String redirectMovimientosAction() throws Exception {

		return SUCCESS;

	}
	
	@Action(value = "justificantesAction", results = {
			@Result(name = SUCCESS, location = "/secured/justificantes.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String redirectJustificantesAction() throws Exception {

		return SUCCESS;

	}
	
	@Action(value = "reportesAction", results = {
			@Result(name = SUCCESS, location = "/secured/reportesTableau.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String redirectReportesAction() throws Exception {

		return SUCCESS;

	}
	
	@Action(value = "satAction", results = {
			@Result(name = SUCCESS, location = "/secured/anexo24.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String redirectSATAction() throws Exception {

		return SUCCESS;

	}
	
	@Action(value = "configuracionAction", results = {
			@Result(name = SUCCESS, location = "/secured/settings.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String redirectConfiguracionAction() throws Exception {

		return SUCCESS;

	}
	
	@Action(value = "facturasAction", results = {
			@Result(name = SUCCESS, location = "/secured/facturas.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String redirectFacturasAction() throws Exception {

		return SUCCESS;

	}

}
