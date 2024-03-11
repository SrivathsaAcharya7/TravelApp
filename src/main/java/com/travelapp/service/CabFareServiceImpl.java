package com.travelapp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelapp.models.CabFare;
import com.travelapp.repo.CabFareRepository;

@Service
public class CabFareServiceImpl implements CabFareService {

	@Autowired
	private CabFareRepository cabFareRepository;

	@Override
	public String addCabFare(CabFare cabFare) {
		CabFare savedCabFare = cabFareRepository.save(cabFare);
		return savedCabFare != null ? "Success" : "Error";
	}

	@Override
	public List<CabFare> getAllCabFares() {
		return cabFareRepository.findAll();
	}

	@Override
	public CabFare getCabFareById(int id) {
		Optional<CabFare> cabFareOptional = cabFareRepository.findById(id);
		return cabFareOptional.orElse(null);
	}

	@Override
	public String updateCabFare(CabFare cabFare) {
		if (cabFareRepository.existsById(cabFare.getId())) {
			CabFare updatedCabFare = cabFareRepository.save(cabFare);
			if (updatedCabFare != null)
				return "Success";
			return "Err";
		}
		return "Cab Fare not found";
	}

	@Override
	public boolean isCabFareExists(String pickupLocation, String dropoffLocation) {
		return cabFareRepository.existsByPickupLocationAndDropoffLocation(pickupLocation, dropoffLocation);
	}

	@Override
	public String deleteCabFare(int id) {
		if (cabFareRepository.existsById(id)) {
			cabFareRepository.deleteById(id);
			return "Success";
		}
		return "Cab Fare not found";
	}
}
