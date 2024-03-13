package com.travelapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.travelapp.models.Booking;
import com.travelapp.models.Cab;
import com.travelapp.models.CabFare;
import com.travelapp.models.Customer;
import com.travelapp.repo.CabFareRepository;
import com.travelapp.service.BookingService;
import com.travelapp.service.CabFareService;
import com.travelapp.service.CabService;
import com.travelapp.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class BookingController {

	@Autowired
	private BookingService bookingService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private CabFareService cabFareService;
	@Autowired
	private CabService cabService;
	@Autowired
	private CabFareRepository cabFareRepository;

	@GetMapping("/bookings")
	public String getAllBookings(Model model) {
		model.addAttribute("bookings", bookingService.getAllBookings());
		return "ViewBookings";
	}

	@GetMapping("/bookcab")
	public String bookCab(Model model, HttpSession session) {

		Integer customerId = (Integer) session.getAttribute("customerId");
		System.out.println(customerId);

		model.addAttribute("booking", new Booking());

		if (customerId != null) {

			List<CabFare> cabFareList = cabFareService.getAllCabFares();

			List<String> uniquePickupLocations = cabFareList.stream().map(CabFare::getPickupLocation).distinct()
					.collect(Collectors.toList());
			model.addAttribute("uniquePickupLocations", uniquePickupLocations);

			List<String> uniqueDropoffLocations = cabFareList.stream().map(CabFare::getDropoffLocation).distinct()
					.collect(Collectors.toList());
			model.addAttribute("uniqueDropoffLocations", uniqueDropoffLocations);

			List<Cab> cabTypeList = cabService.getAllAvailableCabs();
			model.addAttribute("cabTypeList", cabTypeList);

			ObjectMapper objectMapper = new ObjectMapper();
			try {
				String cabFareListJson = objectMapper.writeValueAsString(cabFareList);
				model.addAttribute("cabFareListJson", cabFareListJson);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}

			return "BookCab";
		} else {

			return "error";
		}
	}

	@PostMapping("/mybookings")
	public String getMyBookings(@ModelAttribute Booking booking, @RequestParam("cabId") int cabId,
			@RequestParam("date") String date, @RequestParam("time") String time, HttpSession session,
			RedirectAttributes redirectAttributes) {
		if (!cabFareRepository.existsByPickupLocationAndDropoffLocation(booking.getPickupLocation(),
				booking.getDropoffLocation())) {
			redirectAttributes.addFlashAttribute("error",
					"No cab fare available for the selected pickup and drop-off locations.");
			return "redirect:/bookcab";
		}
		Integer customerId = (Integer) session.getAttribute("customerId");
		if (customerId != null) {
			Customer customer = customerService.getCustomerById(customerId);
			if (customer != null) {
				Cab cab = cabService.getCabById(cabId);
				if (cab != null) {
					cab.setAvailability("Unavailable");
					cabService.updateCab(cab);
					booking.setCustomerName(customer.getName());
					String dateTime = date + " " + time;
					booking.setDate(dateTime);
					booking.setCabType(cab.getType());
					booking.setCustomerId(customerId);
					String result = bookingService.addBooking(booking);
					if ("Success".equals(result)) {
						return "redirect:/bookinghistory";
					} else {

						return "error";
					}
				} else {

					return "error";
				}
			} else {

				return "error";
			}
		} else {

			return "error";
		}
	}

	@GetMapping("/bookinghistory")
	public String showBookingHistory(Model model, HttpSession session) {
		Integer customerId = (Integer) session.getAttribute("customerId");
		if (customerId != null) {

			List<Booking> bookings = bookingService.getBookingsByCustomerId(customerId);
			model.addAttribute("bookings", bookings);
			return "BookingHistory";
		} else {

			return "error";
		}
	}

	@GetMapping("/updateBookingStatus/{bookingId}")
	public String updateBookingStatus(@PathVariable int bookingId, Model model) {
		Booking booking = bookingService.getBookingById(bookingId);
		if (booking != null) {
			model.addAttribute("booking", booking);
			return "UpdateBookingStatus";
		}
		return "redirect:/bookings";
	}

	@PostMapping("/updateBookingStatusInfo")
	public String updateBookingStatusPost(@ModelAttribute Booking booking, Model model) {

		Booking existingBooking = bookingService.getBookingById(booking.getId());

		if (existingBooking != null) {
			String result = bookingService.updateBookingStatus(booking.getId(), booking.getStatus());
			if ("Success".equals(result)) {
				if ("Completed".equals(booking.getStatus())) {
					Cab cab = cabService.getCabById(existingBooking.getCabId());
					if (cab != null) {

						cab.setAvailability("Available");

						cabService.updateCab(cab);
					}
				}
				model.addAttribute("info", "Booking status updated successfully");
			}

			else {
				model.addAttribute("error", "Failed to update booking status");
			}
		} else {
			model.addAttribute("error", "Booking not found");
		}
		return "redirect:/bookings";
	}

	@GetMapping("/deleteBooking/{bookingId}")
	public String deleteBooking(@PathVariable int bookingId, Model model) {
		bookingService.deleteBooking(bookingId);
		return "redirect:/bookings";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
