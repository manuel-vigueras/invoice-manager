package com.mx.sivale.actions;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Namespaces;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@ParentPackage(value = "json-default")
@Namespaces(value = { @Namespace("/secured"), @Namespace("/") })
public class JustificanteAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2325504132155921304L;

	private List<String> listaJustificantes = new ArrayList<String>();

	@Action(value = "filtroJustificanteAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"listaJustificantes", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String filtroJustificante() throws Exception {

		listaJustificantes.add("Pachuca");
		listaJustificantes.add("Acapulco");
		listaJustificantes.add("California");
		listaJustificantes.add("Monterrey");

		return SUCCESS;

	}

	public List<String> getListaJustificantes() {
		return listaJustificantes;
	}

	public void setListaJustificantes(List<String> listaJustificantes) {
		this.listaJustificantes = listaJustificantes;
	}
	
}
