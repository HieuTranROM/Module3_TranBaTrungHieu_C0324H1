package com.codegym.tao_ung_dung_quan_ly_san_pham.controller;

import com.codegym.tao_ung_dung_quan_ly_san_pham.model.Product;
import com.codegym.tao_ung_dung_quan_ly_san_pham.service.ProductService;
import com.codegym.tao_ung_dung_quan_ly_san_pham.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {

    private static ProductService productService = new ProductServiceImpl();
    private static List<Product> products = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                req.getRequestDispatcher("/product/create.jsp").forward(req, resp);
                break;
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                Product productEdit = productService.findById(id);
                req.setAttribute("product", productEdit);
                req.getRequestDispatcher("/product/update.jsp").forward(req, resp);
                break;
            case "search":
                String searchProduct = req.getParameter("searchProduct");
                List<Product> searchProducts = productService.searchByName(searchProduct);
                req.setAttribute("searchProducts", searchProducts);
                req.getRequestDispatcher("/product/search.jsp").forward(req, resp);
                break;
            default:
                List<Product> products = productService.findAll();
                req.setAttribute("products", products);
                req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String nameProduct = req.getParameter("nameProduct");
                int price = Integer.parseInt(req.getParameter("price"));
                String description = req.getParameter("description");
                String producer = req.getParameter("producer");
                Product product = new Product(nameProduct, price, description, producer);
                productService.save(product);
                resp.sendRedirect("/product");
                break;
            case "delete":;
                int id = Integer.parseInt(req.getParameter("id"));
                Boolean isDelete = productService.remove(id);
                if (isDelete) {
                    resp.sendRedirect("/product");
                } else {
                    req.setAttribute("message", "Xóa không thành công");
                    products = productService.findAll();
                    req.setAttribute("products", products);
                    req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
                }
                break;
            case "update":
                int idUpdate = Integer.parseInt(req.getParameter("id"));
                String updatedName = req.getParameter("nameProduct");
                int updatedPrice = Integer.parseInt(req.getParameter("price"));
                String updatedDescription = req.getParameter("description");
                String updatedProducer = req.getParameter("producer");
                boolean isUpdated = productService.updateProduct(idUpdate, updatedName,updatedPrice, updatedDescription, updatedProducer);
                if (isUpdated) {
                    resp.sendRedirect("/product");
                } else {
                    req.setAttribute("message", "Cập nhật không thành công!!!");
                    List<Product> products = productService.findAll();
                    req.setAttribute("products", products);
                    req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
                }
                break;
            default:
                break;
        }
    }
}