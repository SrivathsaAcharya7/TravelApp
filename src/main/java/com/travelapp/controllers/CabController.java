package com.travelapp.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.travelapp.models.Cab;
import com.travelapp.service.CabService;

@Controller
public class CabController {

	@Autowired
	private CabService cabService;

	@GetMapping("newcab")
	public String newCab(Model model) {
		model.addAttribute("cab", new Cab());
		return "AddCab";
	}

	@PostMapping("/newcabinfo")
	public String addCab(@ModelAttribute Cab cab, Model model) {
		String result = cabService.addCab(cab);
		if ("Success".equals(result)) {
			model.addAttribute("info", "Cab is Added");
			model.addAttribute("cab", new Cab());
		}
		return "redirect:/caball";
	}

	@GetMapping("/caball")
	public String viewAllCabs(Model model) {
		List<Cab> cabList = cabService.ViewAllCabs();
		model.addAttribute("cabList", cabList);
		return "ViewAllCabs";
	}

	@GetMapping("/gg")
	public String viewAvailableCabs(Model model) {
		List<Cab> cabList = cabService.getAllAvailableCabs();
		model.addAttribute("cabList", cabList);
		return "ViewAllCabs";
	}

	@GetMapping("/updatecab/{id}")
	public String updateCabForm(@PathVariable int id, Model model) {
		Cab cab = cabService.getCabById(id);
		if (cab != null) {
			model.addAttribute("cab", cab);
			return "UpdateCab";
		}
		return "redirect:/caball";
	}

	@PostMapping("/updatecab/updatecabinfo")
	public String updateCab(@ModelAttribute Cab cab, Model model) {
		String result = cabService.updateCab(cab);
		if ("Success".equals(result)) {
			model.addAttribute("info", "Cab is Updated");
		} else {
			model.addAttribute("error", "Failed to update Cab");
		}
		return "redirect:/caball";
	}

	@GetMapping("/delcab/{id}")
	public String deleteCab(@PathVariable int id) {
		cabService.deleteCab(id);
		return "redirect:/caball";
	}
}
