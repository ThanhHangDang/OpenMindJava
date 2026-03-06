package com.example.openmind.controller;

import java.util.Locale.Category;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.openmind.domain.Product;
import com.example.openmind.service.CategoryService;
import com.example.openmind.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final ProductService productService;
    private final CategoryService categoryService;
    public AdminController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }

    @RequestMapping("/products")
    public String products(Model model,
        @RequestParam(required = false) Long categoryId,
        @RequestParam(required = false) String keyWord,
        // @RequestParam(required = false) String sortBy,
        @RequestParam(defaultValue = "0") Integer minPrice,
        @RequestParam(defaultValue = "3000000") Integer maxPrice,
        @RequestParam(defaultValue = "0") int pageNumber
    ) {
        Page<Product> allProducts = this.productService.filterProducts(keyWord, categoryId, minPrice, maxPrice, pageNumber);
        model.addAttribute("products", allProducts.getContent());
        model.addAttribute("totalPages", allProducts.getTotalPages());
        model.addAttribute("currentPage", pageNumber);
        return "admin/products";
    }

    @RequestMapping("/product-detail/{id}")
    public String productDetail(Model model, @PathVariable Long id) {
        Product product = this.productService.getProductById(id);
        if (product == null) {
            return "redirect:/admin/products";
        }
        model.addAttribute("product", product);
        return "admin/product-detail";
    }

    @RequestMapping("/products/add-product")
    public String addProduct(Model model) {
        model.addAttribute("categories", this.categoryService.countProductsByCategory());
        model.addAttribute("newProduct", new Product());
        return "admin/add-product";
    }

    @RequestMapping(value = "/products/add-product", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute("newProduct") Product product) {
        this.productService.saveProduct(product);
        return "redirect:/admin/products";
    }

}
