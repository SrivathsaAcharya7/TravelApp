package com.travelapp.service;

import java.util.List;

import com.travelapp.models.CabFare;

public interface CabFareService {
	public String addCabFare(CabFare cabFare);

	public List<CabFare> getAllCabFares();

	public CabFare getCabFareById(int id);

	public String updateCabFare(CabFare cabFare);

	public String deleteCabFare(int id);

	boolean isCabFareExists(String pickupLocation, String dropoffLocation);
}
