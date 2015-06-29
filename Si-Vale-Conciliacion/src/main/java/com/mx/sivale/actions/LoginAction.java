package com.mx.sivale.actions;

import java.util.Date;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.mx.sivale.service.UsuarioService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Clase Action para el manejo del login. JSP que utiliza al action: login.jsp.
 * 
 * @author Kevin Mendez, 2Big.
 *
 */

@Namespace("/")
public class LoginAction extends ActionSupport implements SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 643905955680222916L;

	@Autowired
	public UsuarioService usuarioService;

	private String user;
	private String password;
	public Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

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
		
		 if ((getUser().equals("kevin")) && (getPassword().equals("a"))) {
			 session.put("logged", new Date());
			 session.put("userName", getUser());
			 
			 System.out.println(
			 "logged: "+session.get("logged")
			 ); 
			 
		 return SUCCESS;
		 } else
			 return ERROR;

		//
//		session.put("logged", new Date());
//		session.put("userName", getUser());
//
//		return SUCCESS;

	}

	@Action(value = "logout", results = {
			@Result(name = SUCCESS, location = "/login.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String logout() throws Exception {

		session.remove("logged");
		session.remove("userName");
		return SUCCESS;
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