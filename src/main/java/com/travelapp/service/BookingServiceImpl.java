package com.travelapp.service;

import com.travelapp.models.Booking;


import com.travelapp.repo.BookingRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookingServiceImpl implements BookingService {

	@Autowired
	private BookingRepository bookingRepository;

	@Override
	public List<Booking> getAllBookings() {
		return bookingRepository.findAll();
	}

	@Override
	public String updateBookingStatus(int bookingId, String status) {
		Booking booking = bookingRepository.findById(bookingId).orElse(null);
		if (booking != null) {
			booking.setStatus(status);
			bookingRepository.save(booking);
			return "Success";
		}
		return "Err";
	}

	@Override
	public String addBooking(Booking booking) {
		try {
			bookingRepository.save(booking);
			return "Success";
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}

	@Override
	public Booking getBookingById(int id) {
		Optional<Booking> bookOptional = bookingRepository.findById(id);
		return bookOptional.orElse(null);
	}

	@Override
	public List<Booking> getBookingsByCustomerId(int customerId) {
		return bookingRepository.findByCustomerId(customerId);
	}

	@Override
	public String deleteBooking(int bookingId) {
		try {
			bookingRepository.deleteById(bookingId);
			return "Success";
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}

}
