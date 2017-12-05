package iBus.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import iBus.model.Avaliacao;
import iBus.model.Motorista;
import iBus.repository.AvaliacaoRepository;
import iBus.repository.MotoristaRepository;

@Controller
public class AvaliacaoController {
	@Autowired
	private AvaliacaoRepository avaliacaoRepo;
	@Autowired
	private MotoristaRepository motoristaRepo;

	@PostMapping("/user/avaliacao")
	public String addAvaliacao(@Valid Avaliacao avaliacao, BindingResult result, 
			Model model, RedirectAttributes redirectAttributes) {
		if(result.hasErrors()) {
			List<Motorista> motoristas = new ArrayList<Motorista>();
			motoristas = motoristaRepo.findAll();
			model.addAttribute("motoristas", motoristas);
			model.addAttribute("avaliacao", avaliacao);
			return "user/insere_avaliacao";
		}
		avaliacao.getMotorista().somarAvaliação(avaliacao.getNota());;
		avaliacaoRepo.save(avaliacao);
		motoristaRepo.save(avaliacao.getMotorista());
		redirectAttributes.addFlashAttribute("msg", "Avaliacao enviada com sucesso.");
		return "redirect:itinerario";
	}

	@GetMapping("/user/avaliacao/add")
	public String insereAvaliacao(Model model) {
		Iterable<Motorista> motoristas;
		motoristas = motoristaRepo.findAll();
		model.addAttribute("motoristas", motoristas);
		model.addAttribute("avaliacao", new Avaliacao());
		return "user/insere_avaliacao";
	}

}
