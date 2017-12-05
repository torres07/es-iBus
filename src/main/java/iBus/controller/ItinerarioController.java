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

import iBus.model.Itinerario;
import iBus.repository.ItinerarioRepository;

@Controller
public class ItinerarioController {
	@Autowired
	private ItinerarioRepository itinerarioRepo;
	
	@GetMapping("/itinerario")
	public String listaItinerario(Model model){
		Iterable<Itinerario> lista = itinerarioRepo.findAll( 
				new Sort(new Sort.Order(Sort.Direction.ASC, "inicio")));
		model.addAttribute("itinerario", lista);
		return "lista_itinerario";
	}
	
	@GetMapping("/user/itinerario")
	public String listaItinerarioUser(Model model){
		Iterable<Itinerario> lista = itinerarioRepo.findAll( 
				new Sort(new Sort.Order(Sort.Direction.ASC, "inicio")));
		model.addAttribute("itinerario", lista);
		return "user/lista_itinerario";
	}
	
	@PostMapping("/itinerario")
	public String addItinerario(@Valid Itinerario itinerario, BindingResult result, 
			Model model, RedirectAttributes redirectAttributes) {
		
		if(result.hasErrors()) {
			model.addAttribute("itinerario", itinerario);
			if (itinerario.getId() == null) {
				return "insere_itinerario";
			} else {
				return "altera_contato";
			}
		}
		
		if (itinerario.getId() == null) {
			itinerario.setInicio(itinerario.getInicio().replaceAll("\\s+", ""));
			itinerario.setFim(itinerario.getFim().replaceAll("\\s+", ""));
			itinerarioRepo.save(itinerario);
			redirectAttributes.addFlashAttribute("msg", "Viagem inserida com sucesso.");
		} else {
			itinerario.setInicio(itinerario.getInicio().replaceAll("\\s+", ""));
			itinerario.setFim(itinerario.getFim().replaceAll("\\s+", ""));
			itinerarioRepo.save(itinerario);
			redirectAttributes.addFlashAttribute("msg", "Viagem atualizada com sucesso.");
		}
		return "redirect:/itinerario";
	}
	
	@GetMapping("/itinerario/add")
	public String insereViagem(Model model) {
		model.addAttribute("itinerario", new Itinerario());
		return "insere_itinerario";
	}
	
	@RequestMapping("/itinerario/{id}/update")
	public String alteraForm(@PathVariable Integer id, Model model) {
		Itinerario c = itinerarioRepo.findOne(id);
		model.addAttribute("itinerario", c);
		return "altera_itinerario";
	}
	
	@GetMapping("/itinerario/{id}/delete")
	public String deleteViagem(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
		System.out.println("id: " + id);
		Itinerario itinerario = new Itinerario(id);
		itinerarioRepo.delete(itinerario);
		redirectAttributes.addFlashAttribute("msg", "Viagem removida com sucesso.");
		return "redirect:/itinerario";
	}
}
