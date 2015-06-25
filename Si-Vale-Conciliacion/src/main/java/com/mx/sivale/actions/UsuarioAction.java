package com.mx.sivale.actions;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Namespaces;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.mx.sivale.service.UsuarioService;
import com.mx.sivale.to.UsuarioTO;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage(value = "json-default")
@Namespaces(value = { @Namespace("/secured"), @Namespace("/") })
public class UsuarioAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3044123933284462074L;

	@Autowired
	UsuarioService usuarioService;

	private List<UsuarioTO> usuariosFiltrados = new ArrayList<UsuarioTO>();

	private String usuario;

	@Action(value = "filtroUsuariosAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"usuariosFiltrados", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String filtroUsuarios() throws Exception {

		usuariosFiltrados = usuarioService.getAllByAdmin(1);

		return SUCCESS;

	}

	@Action(value = "usuarioAction", results = {
			@Result(name = SUCCESS, type = "json", params = { "root",
					"usuariosFiltrados", "excludeNullProperties", "true",
					"noCache", "true" }),
			@Result(name = ERROR, location = "/error.jsp") })
	public String usuarioAction() throws Exception {

		System.out.println(usuario);

		return SUCCESS;

	}

	public List<UsuarioTO> getUsuariosFiltrados() {
		return usuariosFiltrados;
	}

	public void setUsuariosFiltrados(List<UsuarioTO> usuariosFiltrados) {
		this.usuariosFiltrados = usuariosFiltrados;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

}
