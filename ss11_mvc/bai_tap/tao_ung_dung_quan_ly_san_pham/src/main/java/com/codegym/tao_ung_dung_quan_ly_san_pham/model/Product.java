package com.codegym.tao_ung_dung_quan_ly_san_pham.model;

public class Product {
    private int id;
    private String nameProduct;
    private int price;
    private String description;
    private String producer;

    public Product() {
    }

    public Product(String nameProduct, int price, String description, String producer) {
        this.nameProduct = nameProduct;
        this.price = price;
        this.description = description;
        this.producer = producer;
    }

    public Product(int id, String nameProduct, int price, String description, String producer) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.price = price;
        this.description = description;
        this.producer = producer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }
}
