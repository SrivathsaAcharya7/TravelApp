package com.travelapp.repo;

import java.util.List;

import com.travelapp.models.Cab;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CabRepository extends JpaRepository<Cab, Integer> {
    List<Cab> findByAvailability(String availability);
}
