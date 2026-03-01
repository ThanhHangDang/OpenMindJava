package com.example.openmind.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.openmind.domain.Category;
import com.example.openmind.domain.Product;
import com.example.openmind.service.CategoryService;
import com.example.openmind.service.ProductService;

@Controller
public class HomeController {
    private final ProductService productService;
    private final CategoryService categoryService;
    public HomeController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }

    
    @RequestMapping("/")
    public String home(Model model) {
        List<Product> allProducts = this.productService.getAllProducts();
        List<Product> latestProducts = this.productService.getLatestProducts();
        List<Category> categories = this.categoryService.countProductsByCategory();
        model.addAttribute("categories", categories);
        model.addAttribute("latestProducts", latestProducts);
        model.addAttribute("products", allProducts);
        System.out.println(allProducts);
        return "home/home";
    }

    @RequestMapping("/cart")
    public String cart(Model model) {
        return "cart/cart";
    }

    @RequestMapping("/feedback")
    public String feedback(Model model) {
        return "feedback/feedback";
    }

    @RequestMapping("/product-detail/{id}")
    public String productDetail(Model model, @PathVariable Long id){
        Product product = this.productService.getProductById(id);
        if (product == null) {
            return "redirect:/"; // Nếu sản phẩm không tồn tại, chuyển hướng về trang chủ
        }
        // Tăng view count
        int currentViewCount = product.getViewCount();
        product.setViewCount(currentViewCount + 1);
        this.productService.saveProduct(product); // Lưu lại sản phẩm với view count mới
        model.addAttribute("product", product);
        return "product/product-detail";
    }
}
