package iBus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import iBus.model.Usuario;
import iBus.repository.UsuarioRepository;

@Controller
public class GeneralController {
	@Autowired
	UsuarioRepository usuarioRepo;
	
	@RequestMapping("/")
	public String home(Model model){
		model.addAttribute("usuario", new Usuario());
		return "index";
	}
	
	@RequestMapping("/efetuar_login")
	public String buscarUsuarioLogin(Model model, Usuario usuario,
			HttpServletRequest request, HttpServletResponse response, HttpSession session,
			RedirectAttributes redirectAttributes){
		
		Usuario u = usuarioRepo.getUsuarioByMatricula(usuario.getMatricula());
		if (u != null){
			if (u.getSenha().equals(usuario.getSenha())){
				System.out.println("deu bom!");
				session.setAttribute("usuario_logado", u);
				if (u.getTipo().equals("Admin")) {
					session.setAttribute("login", "admin");
				}
				else if (u.getTipo().equals("Motorista")) {
					session.setAttribute("login", "motorista");
				} 
				else {
					session.setAttribute("login", "usuario");
				}
				redirectAttributes.addFlashAttribute("msg", "Login efetuado com sucesso!");
				return "redirect:/";
			}			
		}
		redirectAttributes.addFlashAttribute("msg", "Login ou senha incorretos!");
		return "redirect:/";		
	}
	
	@GetMapping("/logout")
	public String efetuarLogout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
}
