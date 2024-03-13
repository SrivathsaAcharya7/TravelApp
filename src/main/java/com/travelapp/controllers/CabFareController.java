package com.travelapp.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.PathVariable;

import com.travelapp.models.CabFare;
import com.travelapp.repo.CabFareRepository;
import com.travelapp.service.CabFareService;

@Controller
public class CabFareController {

	@Autowired
	private CabFareService cabFareService;
	@Autowired
	private CabFareRepository cabFareRepository;

	@GetMapping("/newcabfare")
	public String newCabFare(Model model) {
		model.addAttribute("cabFare", new CabFare());
		return "AddCabFare";
	}

	@PostMapping("/newcabfareinfo")
	public String addCabFare(@ModelAttribute CabFare cabFare, Model model, RedirectAttributes redirectAttributes) {

		if (cabFare.getPickupLocation().equals(cabFare.getDropoffLocation())) {
			redirectAttributes.addFlashAttribute("info", "pickup and drop-off locations should not be same.");
			return "redirect:/newcabfare";
		} else if (cabFareRepository.existsByPickupLocationAndDropoffLocation(cabFare.getPickupLocation(),
				cabFare.getDropoffLocation())) {
			redirectAttributes.addFlashAttribute("info",
					"Cab Fare already exists for the given pickup and drop-off locations.");
			return "redirect:/newcabfare";
		} else {
			String result = cabFareService.addCabFare(cabFare);
			if ("Success".equals(result)) {
				model.addAttribute("info", "Cab Fare is Added");
				model.addAttribute("cabFare", new CabFare());
			}
			return "redirect:/viewallcabfares";
		}

	}

	@GetMapping("/viewallcabfares")
	public String viewAllCabFares(Model model) {
		List<CabFare> cabFareList = cabFareService.getAllCabFares();
		model.addAttribute("cabFareList", cabFareList);
		return "ViewAllCabFares";
	}

	@GetMapping("/updatecabfare/{id}")
	public String updateCabFareForm(@PathVariable int id, Model model) {
		CabFare cabFare = cabFareService.getCabFareById(id);
		if (cabFare != null) {
			model.addAttribute("cabFare", cabFare);
			return "UpdateCabFare";
		}
		return "redirect:/viewallcabfares";
	}

	@PostMapping("/updatecabfareinfo")
	public String updateCabFare(@ModelAttribute CabFare cabFare, Model model) {
		String result = cabFareService.updateCabFare(cabFare);
		if ("Success".equals(result)) {
			model.addAttribute("info", "Cab Fare is Updated");
		} else {
			model.addAttribute("info", "Failed to update Cab Fare");
		}
		return "redirect:/viewallcabfares";
	}

	@GetMapping("/deletecabfare/{id}")
	public String deleteCabFare(@PathVariable int id) {
		cabFareService.deleteCabFare(id);
		return "redirect:/viewallcabfares";
	}
}
