package iBus.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import iBus.model.Usuario;
import iBus.repository.UsuarioRepository;

@Controller
public class UsuarioController {
	@Autowired
	private UsuarioRepository usuarioRepo;
	
	@GetMapping("/usuarios")
	public String listaItinerario(Model model){
		Iterable<Usuario> lista = usuarioRepo.findAll( 
				new Sort(new Sort.Order(Sort.Direction.ASC, "matricula")));
		model.addAttribute("usuarios", lista);
		return "lista_usuario";
	}
	
	@PostMapping("/usuarios")
	public String addUsuario(@Valid Usuario usuario, BindingResult result, 
			Model model, RedirectAttributes redirectAttributes) {
		
		if(result.hasErrors()) {
			model.addAttribute("usuario", usuario);
			if (usuario.getMatricula() == null) {
				return "insere_usuario";
			} else {
				return "altera_usuario";
			}
		}
		
		if (usuario.getMatricula() == null) {
			usuarioRepo.save(usuario);
			redirectAttributes.addFlashAttribute("msg", "Usuário inserido com sucesso.");
		} else {
			usuarioRepo.save(usuario);
			redirectAttributes.addFlashAttribute("msg", "Usuário inserido com sucesso.");
		}
		return "redirect:/usuarios";
	}
	
	@GetMapping("/usuarios/add")
	public String insereUsuario(Model model) {
		model.addAttribute("usuario", new Usuario());
		return "insere_usuario";
	}
	
	@RequestMapping("/usuarios/{matricula}/update")
	public String alteraForm(@PathVariable Integer matricula, Model model) {
		Usuario c = usuarioRepo.findOne(matricula);
		model.addAttribute("usuario", c);
		return "altera_usuario";
	}
	
	@GetMapping("/usuarios/{matricula}/delete")
	public String deleteUsuario(@PathVariable Integer matricula, RedirectAttributes redirectAttributes) {
		System.out.println("matricula: " + matricula);
		Usuario usuario = new Usuario(matricula);
		usuarioRepo.delete(usuario);
		redirectAttributes.addFlashAttribute("msg", "Usuario removido com sucesso.");
		return "redirect:/usuarios";
	}
	
}
