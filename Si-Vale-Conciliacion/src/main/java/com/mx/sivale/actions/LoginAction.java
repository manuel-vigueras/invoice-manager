package com.mx.sivale.actions;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	@Action(value = "login")
	public void login() throws Exception {
		
		HttpServletRequest req = ServletActionContext.getRequest();	
		HttpServletResponse resp = ServletActionContext.getResponse(); 
		String user = req.getParameter("j_username");
	    String pass = req.getParameter("j_password");	    	   	    	   
	    	    
	    try{   
	    String url = "j_security_check?j_username=" + user + "&j_password=" + pass;
		String redirectUrl = resp.encodeRedirectURL(url);
		resp.sendRedirect(redirectUrl);
		System.out.println("redirect..........");
	    }catch(Exception e){
	    	System.out.println("Error al loguear "+e);
	    }
		
	    Map<String, Object> res; 
		if((res = usuarioService.exists(user, pass))!=null){
			 session.put("noTarjeta", res.get("idTarjeta"));
			 session.put("userName", res.get("username"));
			 req.getSession().setAttribute("userr", user);
			 
			 System.out.println(
					 "logged: "+session.get("logged")+" - user: "+user
			 );		
		}
	    
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