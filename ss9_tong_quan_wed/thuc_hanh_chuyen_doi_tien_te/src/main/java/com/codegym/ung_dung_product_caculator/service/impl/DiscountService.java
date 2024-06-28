package com.codegym.ung_dung_product_caculator.service.impl;

import com.codegym.ung_dung_product_caculator.service.IService;

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
