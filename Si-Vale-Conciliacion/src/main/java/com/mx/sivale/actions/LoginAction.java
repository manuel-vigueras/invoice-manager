package com.mx.sivale.actions;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
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
			
		Map<String, Object> res = new HashMap<String, Object>(); 
		
		if((res = usuarioService.exists(getUser(), getPassword()))!=null){
			 session.put("noTarjeta", res.get("idTarjeta"));
			 session.put("userName", res.get("username"));
			 
			 System.out.println(
					 "logged: "+session.get("logged")+" - user: "+user
			 );
			 return SUCCESS; 
		}
				
		else
			return ERROR;

	}

	@Action(value = "logout", results = {
			@Result(name = SUCCESS, location = "/login.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String logout() throws Exception {
		 		
		session.remove("logged");
		session.remove("userName");
		HttpServletRequest request = ServletActionContext.getRequest();		
		System.out.println("User Logout... "+request.getUserPrincipal().getName());
		request.getSession().invalidate(); 
					
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