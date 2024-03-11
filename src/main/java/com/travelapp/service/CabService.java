package com.travelapp.service;

import java.util.List;

import com.travelapp.models.Cab;

public interface CabService {
	public String addCab(Cab cab);

	public List<Cab> getAllAvailableCabs();

	public List<Cab> ViewAllCabs();

	public Cab getCabById(int id);

	public String updateCab(Cab cab);

	public String deleteCab(int id);
}
