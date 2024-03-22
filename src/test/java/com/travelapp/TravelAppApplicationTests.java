package com.travelapp;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.assertj.core.api.Assertions.assertThat;
import java.util.List;

import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.travelapp.models.Booking;
import com.travelapp.models.Cab;
import com.travelapp.models.CabFare;
import com.travelapp.models.Customer;
import com.travelapp.service.BookingService;
import com.travelapp.service.CabFareService;
import com.travelapp.service.CabService;
import com.travelapp.service.CustomerService;

@SpringBootTest
@TestMethodOrder(OrderAnnotation.class)
class TravelAppApplicationTests {

	@Test
	void contextLoads() {
	}

	@Autowired
	CabService cabService;
	@Autowired
	CabFareService cabFareService;
	@Autowired
	CustomerService customerService;
	@Autowired
	BookingService bookingService;

	// CabService Test
	@Test
	@Order(1)
	public void testAddCab() {
		Cab cab = new Cab();
		cab.setRegistrationNumber("ABC123");
		cab.setType("SUV");
		cab.setAvailability("Available");

		String result = cabService.addCab(cab);
		assertNotNull(result);
	}

	@Test
	@Order(2)
	public void testGetAllAvailableCabs() {
		List<Cab> cabList = cabService.getAllAvailableCabs();
		assertThat(cabList).size().isGreaterThan(0);
	}

	@Test
	@Order(3)
	public void testViewAllCabs() {
		List<Cab> cabList = cabService.ViewAllCabs();
		assertThat(cabList).size().isGreaterThan(0);
	}

	@Test
	@Order(4)
	public void testGetCabById() {
		Cab cab = cabService.getCabById(1);
		assertNotNull(cab);
	}

	@Test
	@Order(5)
	public void testUpdateCab() {
		Cab cab = cabService.getCabById(12);
		cab.setType("SUV");
		String result = cabService.updateCab(cab);
		assertEquals("Success", result);
	}



	// CabFareService Test
	@Test
	@Order(7)
	public void testAddCabFare() {
		CabFare cabFare = new CabFare();
		cabFare.setPickupLocation("Location A");
		cabFare.setDropoffLocation("Location B");
		cabFare.setFarePrice(20.0);

		String result = cabFareService.addCabFare(cabFare);
		assertNotNull(result);
	}

	@Test
	@Order(8)
	public void testGetAllCabFares() {
		List<CabFare> cabFareList = cabFareService.getAllCabFares();
		assertThat(cabFareList).size().isGreaterThan(0);
	}

	@Test
	@Order(9)
	public void testGetCabFareById() {
		CabFare cabFare = cabFareService.getCabFareById(9);
		assertNotNull(cabFare);
	}

	@Test
	@Order(10)
	public void testUpdateCabFare() {
		CabFare cabFare = cabFareService.getCabFareById(14);
		cabFare.setFarePrice(25.0);
		String result = cabFareService.updateCabFare(cabFare);
		assertEquals("Success", result);
	}



//CustomerService Test

	@Test
	@Order(12)
	public void testAddCustomer() {
		Customer customer = new Customer();
		customer.setName("John Doe");
		customer.setEmail("john@example.com");
		customer.setPhone("1234567890");
		customer.setPassword("password");

		Customer addedCustomer = customerService.addCustomer(customer);
		assertNotNull(addedCustomer);
		assertNotNull(addedCustomer.getId());
	}

	@Test
	@Order(13)
	public void testGetAllCustomers() {
		List<Customer> customerList = customerService.getAllCustomers();
		assertThat(customerList).size().isGreaterThan(0);
	}

	@Test
	@Order(14)
	public void testGetCustomerById() {
		Customer customer = customerService.getCustomerById(4);
		assertNotNull(customer);
	}

	@Test
	@Order(15)
	public void testUpdateCustomer() {
		Customer customer = customerService.getCustomerById(16);
		customer.setEmail("updated_email@example.com");
		String result = customerService.updateCustomer(customer);
		assertEquals("Success", result);
	}



	@Test
	@Order(17)
	public void testGetCustomerByEmailAndPassword() {
		Customer customer = customerService.getCustomerByEmailAndPassword("tejas@gmail.com", "t@1");
		assertNotNull(customer);
	}

	
	@Test
	@Order(18)
	public void testAddBooking() {
		Booking booking = new Booking();
		booking.setCustomerName("John Doe");
		booking.setPickupLocation("Location A");
		booking.setDropoffLocation("Location B");
		booking.setCabType("Sedan");
		booking.setDate("2024-03-12 20:20");
		booking.setStatus("Pending");
		booking.setCustomerId(99);
		booking.setCabId(22);
		booking.setFarePrice(100);
		String result = bookingService.addBooking(booking);
		assertNotNull(result);
	}

	@Test
	@Order(19)
	public void testGetAllBookings() {
		List<Booking> bookingList = bookingService.getAllBookings();
		assertThat(bookingList).size().isGreaterThan(0);
	}

	@Test
	@Order(20)
	public void testUpdateBookingStatus() {
		String result = bookingService.updateBookingStatus(9, "Confirmed");
		assertEquals("Success", result);
	}

	@Test
	@Order(21)
	public void testGetBookingsByCustomerId() {
		List<Booking> bookingList = bookingService.getBookingsByCustomerId(38);
		assertThat(bookingList).size().isGreaterThan(0);
	}



	@Test
	@Order(23)
	public void testGetBookingById() {
		Booking booking = bookingService.getBookingById(3);
		assertNotNull(booking);
	}

}
