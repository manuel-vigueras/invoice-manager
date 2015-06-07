package com.mx.sivale.actions;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.mx.sivale.service.UsuarioService;
import com.mx.sivale.to.Stock;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Clase Action para el manejo del login. JSP que utiliza al action: login.jsp.
 * 
 * @author Kevin Mendez, 2Big.
 *
 */

@Namespace("/")
public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 643905955680222916L;

	@Autowired
	public UsuarioService usuarioService;

	private String user;
	private String password;

	/**
	 * Metodo que se ejecuta con el llamado del form en login.jsp.
	 * 
	 * @return
	 * @throws Exception
	 */
	@Action(value = "login", results = {
			@Result(name = SUCCESS, location = "/secured/resumen.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String login() throws Exception {
		if ("a".equals(getUser()) && "a".equals(getPassword())) {

//			List<Stock> lista = usuarioService.getAll();

			return SUCCESS;
		} else
			return ERROR;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
