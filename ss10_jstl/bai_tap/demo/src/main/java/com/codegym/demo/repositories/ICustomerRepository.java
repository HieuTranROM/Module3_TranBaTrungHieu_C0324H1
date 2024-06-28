package com.codegym.demo.repositories;

import com.codegym.demo.models.Customer;

import java.util.List;

public interface ICustomerRepository {

    List<Customer> findAll();
}
