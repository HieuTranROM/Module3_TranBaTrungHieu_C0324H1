package com.codegym.ung_dung_product_caculator.service;

public interface IService {
    double discountAmount(float price, float percent);
    double discountPrice(float price, float percent);
}
