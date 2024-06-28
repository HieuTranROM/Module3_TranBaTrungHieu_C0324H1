package com.codegym.thuc_hanh_chuyen_doi_tien_te.controllers;

import com.codegym.thuc_hanh_chuyen_doi_tien_te.service.IService;
import com.codegym.thuc_hanh_chuyen_doi_tien_te.service.impl.DiscountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DisplayCount", value = "/display-discount")
public class DiscountServlet extends HttpServlet {

    private IService service = new DiscountService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float price = Float.parseFloat(request.getParameter("price"));
        float percent = Float.parseFloat(request.getParameter("percent"));
        double discountAmount = service.discountAmount(price,percent);
        double discountPrice = service.discountPrice(price,percent);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("discountPrice", discountPrice);
        request.getRequestDispatcher("display-discount.jsp").forward(request, response);
    }
}