package com.travelapp.service;

import com.travelapp.models.Customer;


import java.util.List;

public interface CustomerService {
	List<Customer> getAllCustomers();

	Customer getCustomerById(int id);

	Customer addCustomer(Customer customer);

	String updateCustomer(Customer customer);

	void deleteCustomer(int id);

	Customer getCustomerByEmailAndPassword(String email, String password);
}
