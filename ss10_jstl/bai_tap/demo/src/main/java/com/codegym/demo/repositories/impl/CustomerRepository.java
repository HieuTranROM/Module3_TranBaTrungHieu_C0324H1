package com.codegym.demo.repositories.impl;

import com.codegym.demo.models.Customer;
import com.codegym.demo.repositories.ICustomerRepository;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> customers;

    static{
        customers = new ArrayList<>();
        customers.add(new Customer("Mai Văn Hoàn", "1983/08/20", "Hà Nội","https://vapa.vn/wp-content/uploads/2022/12/anh-mau-dep-001.jpg"));
        customers.add(new Customer("Nguyễn Văn Nam", "1983/08/21", "Bắc Giang","https://vapa.vn/wp-content/uploads/2022/12/anh-mau-dep-001.jpg"));
        customers.add(new Customer("Nguyễn Thái Hòa", "1983/08/22", "Nam Định","https://vapa.vn/wp-content/uploads/2022/12/anh-mau-dep-001.jpg"));
        customers.add(new Customer("Trần Đăng Khoa", "1983/08/17", "Hà Tây","https://vapa.vn/wp-content/uploads/2022/12/anh-mau-dep-001.jpg"));
        customers.add(new Customer("Nguyễn Đình Thi", "1983/08/19", "Hà Nội","https://vapa.vn/wp-content/uploads/2022/12/anh-mau-dep-001.jpg"));
    }

    public List<Customer> findAll() {
        return customers;
    }
}
