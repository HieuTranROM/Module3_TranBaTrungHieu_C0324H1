package com.codegym.tao_ung_dung_quan_ly_san_pham.repositories.impl;

import com.codegym.tao_ung_dung_quan_ly_san_pham.model.Product;
import com.codegym.tao_ung_dung_quan_ly_san_pham.repositories.ProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static List<Product> products;

    static {
        products = new ArrayList<Product>();
        products.add(new Product(1, "Iphone11", 10000, "Beautifull", "Apple"));
        products.add(new Product(2, "Iphone12", 10000, "Beautifull", "Apple1"));
        products.add(new Product(3, "Iphone13", 10000, "Beautifull", "Apple2"));
        products.add(new Product(4, "Iphone14", 10000, "Beautifull", "Apple3"));
        products.add(new Product(5, "Iphone15", 10000, "Beautifull", "Apple4"));
    }


    public List<Product> findAll() {
        return products;
    }

    public void save(Product product) {
        product.setId(products.get(products.size() - 1).getId() + 1);
        products.add(product);
    }

    public Boolean remove(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                products.remove(product);
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean updateProduct(int id, String nameProduct, int price, String description, String producer) {
        for (Product product : products) {
            if (product.getId() == id) {
                product.setNameProduct(nameProduct);
                product.setPrice(price);
                product.setDescription(description);
                product.setProducer(producer);
                return true;
            }
        }
        return false;
    }


    @Override
    public List<Product> searchByName(String name) {
        List<Product> result = new ArrayList<>();
        for (Product product : products) {
            if (product.getNameProduct().equalsIgnoreCase(name)) {
                result.add(product);
            }
        }
        return result;
    }

    @Override
    public Product findById(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }
}

