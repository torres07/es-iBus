package iBus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import iBus.model.Mapa;
import iBus.repository.MapaRepository;

@Controller
public class MapController {
	@Autowired
	MapaRepository mapaRepo;
	
	@RequestMapping("/map")
	public String mostrarMapa(Model model) {
		Mapa mapa = mapaRepo.findOne(1);
		model.addAttribute("index", mapa.getIndex());
		return "map";
	}
	
	@RequestMapping("/user/map")
	public String mostrarMapaUser(Model model) {
		Mapa mapa = mapaRepo.findOne(1);
		model.addAttribute("index", mapa.getIndex());
		return "user/map";
	}
	
	@RequestMapping("/map/{index}")
	public String atualizaIndex(@PathVariable Integer index) {
		Mapa mapa = mapaRepo.findOne(1);
		mapa.setIndex(index);
		mapaRepo.save(mapa);
		return "redirect:/map";
	}
	
}
