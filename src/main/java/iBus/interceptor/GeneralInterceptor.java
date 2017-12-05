package iBus.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class GeneralInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String URI = request.getRequestURI();
		System.out.println(URI);

		List<String> permitidos = new ArrayList<String>();
		
		permitidos.add("/");
		permitidos.add("/efetuar_login");
		permitidos.add("/logout");
		permitidos.add("/map");
		permitidos.add("/map/0");
		permitidos.add("/map/1");
		permitidos.add("/map/2");
		permitidos.add("/map/3");
		permitidos.add("/map/4");
		permitidos.add("/map/5");
		permitidos.add("/map/6");
		permitidos.add("/map/7");
		
		permitidos.add("/error");
		
		
		
		if (permitidos.contains(URI)){
			return true;
		}
		
		if (request.getSession().getAttribute("usuario_logado") != null){
			if (request.getSession().getAttribute("login").equals("admin")){
				if (URI.contains("/user") || URI.contains("avalicoes_individual")){
					response.sendRedirect("/");
					return false;
				}
				return true;
			}
			
			else if (request.getSession().getAttribute("login").equals("usuario")){
				if (URI.contains("user/")){
					return true;
				}
			}
			
			else if (request.getSession().getAttribute("login").equals("motorista")){
				if (URI.contains("avalicoes_individual") || URI.contains("user/itinerario")){
					return true;
				}
			}
			response.sendRedirect("/");
			return false;
		}
		
		
		response.sendRedirect("/");
		return false;
	}
	
}
