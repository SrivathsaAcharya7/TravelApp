package com.travelapp.repo;

import com.travelapp.models.Booking;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Integer> {
	List<Booking> findByCustomerId(int customerId);
}

