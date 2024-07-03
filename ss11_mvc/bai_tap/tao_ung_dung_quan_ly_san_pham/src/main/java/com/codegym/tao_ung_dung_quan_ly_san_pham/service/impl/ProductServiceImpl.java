package com.codegym.tao_ung_dung_quan_ly_san_pham.service.impl;

import com.codegym.tao_ung_dung_quan_ly_san_pham.model.Product;
import com.codegym.tao_ung_dung_quan_ly_san_pham.repositories.ProductRepository;
import com.codegym.tao_ung_dung_quan_ly_san_pham.repositories.impl.ProductRepositoryImpl;
import com.codegym.tao_ung_dung_quan_ly_san_pham.service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {

    private static ProductRepository productRepository = new ProductRepositoryImpl();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }

    @Override
    public boolean updateProduct(int id, String nameProduct, int price, String description, String producer){
        return productRepository.updateProduct(id, nameProduct, price, description, producer);
    }

    @Override
    public Boolean remove(int id) {
        return productRepository.remove(id);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

}
