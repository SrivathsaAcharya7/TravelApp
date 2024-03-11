package com.travelapp.repo;

import com.travelapp.models.CabFare;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CabFareRepository extends JpaRepository<CabFare, Integer> {
	 boolean existsByPickupLocationAndDropoffLocation(String pickupLocation, String dropoffLocation);
}

