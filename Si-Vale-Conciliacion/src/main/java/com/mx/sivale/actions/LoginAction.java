package com.mx.sivale.actions;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.mx.sivale.service.UsuarioService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.Validations;


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
	
	@Action(value="login",results = {
			@Result(name = SUCCESS, location = "/welcome.jsp"),
			@Result(name = ERROR, location = "/error.jsp") })
	public String login(){
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse(); 
		String user = req.getParameter("j_username");
	    String passwd = req.getParameter("j_password");
			    
	    try{
	    	req.login(user, passwd);
						
			session.put("user", user);
			session.put("password", passwd);
			
		}catch(ServletException e){
			System.out.println("Error al loguear.....");
			return ERROR; 
		}
	    return SUCCESS; 
	}
	
	@Action(value = "userLogin", results = {
			@Result(name = SUCCESS, location = "/user/index.jsp"),
			@Result(name = ERROR, location = "/login.jsp") })
	public String loginUser() throws Exception {
		
		HttpServletRequest req = ServletActionContext.getRequest();	    
		String user = session.get("user").toString();
		String passwd = session.get("password").toString();
		
		if(req.isUserInRole("userRole")){			
		    Map<String, Object> res; 
			if((res = usuarioService.exists(user, passwd ))!=null){
				 session.put("noTarjeta", res.get("idTarjeta"));
				 session.put("userName", res.get("userName"));
				 return SUCCESS; 
	}		
		}
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
}