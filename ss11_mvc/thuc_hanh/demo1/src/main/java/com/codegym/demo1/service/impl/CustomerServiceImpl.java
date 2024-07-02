package com.codegym.demo1.service.impl;

import com.codegym.demo1.model.Customer;
import com.codegym.demo1.service.CustomerService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {

    private static Map<Integer, Customer> customers;

    static {
        customers = new HashMap<>();
        customers.put(1, new Customer("John", "Hanoi" , "john@codegym.vn", 1));
        customers.put(2, new Customer("Bill", "Danang" , "bill@codegym.vn", 2));
        customers.put(3, new Customer("Alex", "Saigon" , "alex@codegym.vn", 3));
        customers.put(4, new Customer("Adam", "Beijin" , "adam@codegym.vn", 4));
        customers.put(5, new Customer("Sophia", "Miami" , "sophia@codegym.vn", 5));
        customers.put(6, new Customer("Rose", "Newyork" , "rose@codegym.vn", 6));
    }
    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void edit(int id, Customer customer) {
        customers.put(id, customer);
    }

    @Override
    public void remove(int id) {
        customers.remove(id);
    }
}
