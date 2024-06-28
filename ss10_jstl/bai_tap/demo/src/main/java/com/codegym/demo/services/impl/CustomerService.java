package com.codegym.demo.services.impl;

import com.codegym.demo.models.Customer;
import com.codegym.demo.repositories.ICustomerRepository;
import com.codegym.demo.repositories.impl.CustomerRepository;
import com.codegym.demo.services.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {

    private static ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }
}
