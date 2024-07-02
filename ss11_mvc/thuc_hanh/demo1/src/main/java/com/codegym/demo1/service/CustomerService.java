package com.codegym.demo1.service;

import com.codegym.demo1.model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    void edit(int id, Customer customer);
    void remove(int id);
}
