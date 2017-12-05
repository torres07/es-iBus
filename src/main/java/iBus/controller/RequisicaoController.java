package iBus.controller;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import iBus.model.Requisicao;
import iBus.repository.RequisicaoRepository;

@Controller
public class RequisicaoController {
	@Autowired
	private RequisicaoRepository requisicaoRepo;
	
	@GetMapping("/requisicoes")
	public String listaRequisicoes(Model model){
		Iterable<Requisicao> lista = requisicaoRepo.findAll( 
				new Sort(new Sort.Order(Sort.Direction.ASC, "id")));
		model.addAttribute("requisicoes", lista);
		return "lista_requisicoes";
	}

	
	@PostMapping("/user/requisicao")
	public String addRequisicao(@Valid Requisicao requisicao, BindingResult result, 
			Model model, RedirectAttributes redirectAttributes) {
		if(result.hasErrors()) {
			model.addAttribute("requisicao", requisicao);
			return "user/insere_requisicao";
		}
		
		if (requisicao.getOrigem().equals("UFC/IFCE")) {
			requisicao.setDestino("Centro");
		}
		else {
			requisicao.setDestino("UFC/IFCE");
		}

		Date data = new Date(System.currentTimeMillis());
		
		String formattedString = data.toString();
		requisicao.setHorario(formattedString);
		
		requisicaoRepo.save(requisicao);
		
		redirectAttributes.addFlashAttribute("msg", "Requisicao de viagem enviada com sucesso.");
		return "redirect:itinerario";
	}
	
	@GetMapping("/user/requisicao/add")
	public String insereRequisicao(Model model) {
		model.addAttribute("requisicao", new Requisicao());
		return "user/insere_requisicao";
	}

}
