package com.travelapp.service;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelapp.models.Cab;
import com.travelapp.repo.CabRepository;

@Service
public class CabServiceImpl implements CabService {

	@Autowired
	private CabRepository cabRepository;

	@Override
	public String addCab(Cab cab) {
		Cab savedCab = cabRepository.save(cab);
		if (savedCab != null)
			return "Success";
		return "Err";
	}

	@Override
	public List<Cab> getAllAvailableCabs() {
		return cabRepository.findByAvailability("Available");
	}

	@Override
	public Cab getCabById(int id) {
		Optional<Cab> cabOptional = cabRepository.findById(id);
		return cabOptional.orElse(null);
	}

	@Override
	public String updateCab(Cab cab) {
		if (cabRepository.existsById(cab.getId())) {
			Cab updatedCab = cabRepository.save(cab);
			if (updatedCab != null)
				return "Success";
			return "Err";
		}
		return "Cab not found";
	}

	@Override
	public List<Cab> ViewAllCabs() {
		List<Cab> cablist = cabRepository.findAll();

		return cablist;
	}

	@Override
	public String deleteCab(int id) {
		if (cabRepository.existsById(id)) {
			cabRepository.deleteById(id);
			return "Success";
		}
		return "Cab not found";
	}
}
