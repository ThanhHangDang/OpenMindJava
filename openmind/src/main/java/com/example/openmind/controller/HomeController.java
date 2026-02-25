package com.example.openmind.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(Model model) {
        return "home/home";
    }

    @RequestMapping("/cart")
    public String cart(Model model) {
        return "cart/cart";
    }

    @RequestMapping("/product-detail")
    public String productDetail(Model model){
        return "product/product-detail";
    }
}
