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

import iBus.model.Motorista;
import iBus.model.Usuario;
import iBus.repository.MotoristaRepository;
import iBus.repository.UsuarioRepository;

@Controller
public class MotoristaController {
	@Autowired
	MotoristaRepository motoristaRepo;
	
	@Autowired
	UsuarioRepository usuarioRepo;
	
	@GetMapping("/motoristas")
	public String listaItinerario(Model model){
		Iterable<Motorista> lista = motoristaRepo.findAll( 
				new Sort(new Sort.Order(Sort.Direction.ASC, "id")));
		model.addAttribute("motoristas", lista);
		return "admin/lista_motorista";
	}
	
	@PostMapping("/motoristas")
	public String addmotorista(@Valid Motorista motorista, BindingResult result, 
			Model model, RedirectAttributes redirectAttributes) {
		
		if(result.hasErrors()) {
			model.addAttribute("motorista", motorista);
			if (motorista.getId() == null) {
				return "admin/insere_motorista";
			} else {
				return "admin/altera_motorista";
			}
		}
		
		if (motorista.getId() == null) {
			motoristaRepo.save(motorista);
			Usuario usuario = new Usuario();
			usuario.setMatricula(motorista.getId());
			usuario.setSenha(motorista.getSenha());
			usuario.setTipo("Motorista");
			usuario.setNome(motorista.getNome());
			usuarioRepo.save(usuario);
			redirectAttributes.addFlashAttribute("msg", "Motorista inserido com sucesso.");
		} else {
			motoristaRepo.save(motorista);
			System.out.println(motorista.getId());
			Usuario usuario = new Usuario();
			usuario.setMatricula(motorista.getId());
			usuario.setSenha(motorista.getSenha());
			usuario.setTipo("Motorista");
			usuario.setNome(motorista.getNome());
			usuarioRepo.save(usuario);
			redirectAttributes.addFlashAttribute("msg", "Motorista inserido com sucesso.");
		}
		return "redirect:/motoristas";
	}
	
	@GetMapping("/motoristas/add")
	public String insereMotorista(Model model) {
		model.addAttribute("motorista", new Motorista());
		return "admin/insere_motorista";
	}
	
	@RequestMapping("/motoristas/{id}/update")
	public String alteraForm(@PathVariable Integer id, Model model) {
		Motorista c = motoristaRepo.findOne(id);
		model.addAttribute("motorista", c);
		return "admin/altera_motorista";
	}
	
	@RequestMapping("/motoristas/{id}/avaliacoes")
	public String listaAvaliacoes(@PathVariable Integer id, Model model) {
		Motorista c = motoristaRepo.findOne(id);
		if (c.getAvaliacoes().size() != 0)
			model.addAttribute("media", c.getSomaAvaliacoes() / c.getAvaliacoes().size());
		else
			model.addAttribute("media", 0);
		model.addAttribute("motorista", c);
		return "admin/lista_avaliacoes";
	}
	
	@GetMapping("/motoristas/{id}/delete")
	public String deletemotorista(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
		System.out.println("id: " + id);
		Motorista motorista = new Motorista(id);
		motoristaRepo.delete(motorista);
		redirectAttributes.addFlashAttribute("msg", "Motorista removido com sucesso.");
		return "redirect:/motoristas";
	}
	
	@RequestMapping("/motorista/{id}/avalicoes_individual")
	public String listaAvaliacoesIndividual(@PathVariable Integer id, Model model) {
		Motorista c = motoristaRepo.findOne(id);
		if (c.getAvaliacoes().size() != 0)
			model.addAttribute("media", c.getSomaAvaliacoes() / c.getAvaliacoes().size());
		else
			model.addAttribute("media", 0);
		model.addAttribute("motorista", c);
		return "motorista/lista_avaliacao";
	}	
}
