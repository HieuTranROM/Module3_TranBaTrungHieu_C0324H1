package com.codegym.demo.models;

import java.util.Date;

public class Customer {
    private String name;
    private String dateOfBirth;
    private String address;
    private String img;

    public Customer() {
    }

    public Customer(String name, String address, String dateOfBirth, String img) {
        this.name = name;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
