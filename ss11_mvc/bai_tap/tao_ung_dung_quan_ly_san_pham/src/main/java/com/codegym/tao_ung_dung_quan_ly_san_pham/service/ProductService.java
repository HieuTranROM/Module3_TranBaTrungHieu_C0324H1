package com.codegym.tao_ung_dung_quan_ly_san_pham.service;

import com.codegym.tao_ung_dung_quan_ly_san_pham.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    void save(Product product);
    List<Product> searchByName(String name);
    boolean updateProduct(int id, String nameProduct, int price, String description, String producer);
    Boolean remove(int id);
    Product findById(int id);
}
