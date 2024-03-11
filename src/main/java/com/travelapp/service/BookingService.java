package com.travelapp.service;

import com.travelapp.models.Booking;

import java.util.List;

public interface BookingService {
	List<Booking> getAllBookings();

	public String updateBookingStatus(int bookingId, String status);

	String addBooking(Booking booking);

	List<Booking> getBookingsByCustomerId(int customerId);

	String deleteBooking(int bookingId);

	public Booking getBookingById(int id);
}
