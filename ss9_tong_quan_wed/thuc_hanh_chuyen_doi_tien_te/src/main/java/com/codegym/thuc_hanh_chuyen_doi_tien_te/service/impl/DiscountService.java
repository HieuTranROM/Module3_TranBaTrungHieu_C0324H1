package com.codegym.thuc_hanh_chuyen_doi_tien_te.service.impl;

import com.codegym.thuc_hanh_chuyen_doi_tien_te.service.IService;

public class DiscountService implements IService {
    @Override
    public double discountAmount(float price, float percent) {
        return price * percent * 0.01;
    }

    @Override
    public double discountPrice(float price, float percent) {
        return price - discountAmount(price, percent);
    }
}
