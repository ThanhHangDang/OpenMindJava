package com.example.openmind.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.openmind.domain.CartItem;
import com.example.openmind.domain.Category;
import com.example.openmind.domain.Product;
import com.example.openmind.service.CategoryService;
import com.example.openmind.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
    private final ProductService productService;
    private final CategoryService categoryService;
    public HomeController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }

    
    @RequestMapping("/")
    public String home(Model model,
        @RequestParam(required = false) Long categoryId,
        @RequestParam(required = false) String keyWord,
        // @RequestParam(required = false) String sortBy,
        @RequestParam(defaultValue = "0") Integer minPrice,
        @RequestParam(defaultValue = "3000000") Integer maxPrice,
        @RequestParam(defaultValue = "0") int pageNumber
    ) {
        // List<Product> allProducts = this.productService.getAllProducts();
        Page<Product> allProducts = this.productService.filterProducts(keyWord, categoryId, minPrice, maxPrice, pageNumber);
        List<Product> latestProducts = this.productService.getLatestProducts();
        List<Category> categories = this.categoryService.countProductsByCategory();
        model.addAttribute("categories", categories);
        model.addAttribute("latestProducts", latestProducts);
        // model.addAttribute("products", allProducts);
        model.addAttribute("products", allProducts.getContent());
        model.addAttribute("totalPages", allProducts.getTotalPages());
        model.addAttribute("currentPage", pageNumber);
        System.out.println(allProducts);
        return "home/home";
    }

    @RequestMapping("/cart")
    public String cart(Model model) {
        return "cart/cart";
    }

    @GetMapping("/add-to-cart")
    public String addToCart(
            Model model,
            @RequestParam Long productId,
            HttpSession session) {

        Product product = productService.findById(productId);

        // Lấy cart từ session
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Kiểm tra sản phẩm đã tồn tại chưa
        boolean exists = false;

        for (CartItem item : cart) {
            if (item.getProductId().equals(productId)) {
                item.setQuantity(item.getQuantity() + 1);
                exists = true;
                break;
            }
        }

        // Nếu chưa tồn tại → thêm mới
        if (!exists) {
            CartItem newItem = new CartItem(
                    product.getId(),
                    product.getProductName(),
                    product.getPrice(),
                    1,
                    product.getImageUrl(),
                    product.getDiscount()
            );
            cart.add(newItem);
        }

        session.setAttribute("cart", cart);
        int subtotal = cart.stream()
                .mapToInt(item -> item.getPrice() * item.getQuantity())
                .sum();
        session.setAttribute("subtotal", subtotal);
        int totalDiscount = cart.stream()
                .mapToInt(item -> item.getPrice() * item.getQuantity() * item.getDiscount() / 100)
                .sum();
        session.setAttribute("totalDiscount", totalDiscount);
        int total = subtotal - totalDiscount;
        session.setAttribute("total", total);

        return "redirect:/cart";
    }

    @RequestMapping("/remove-from-cart")
    public String deleteFromCart(
            Model model,
            @RequestParam Long productId,
            HttpSession session) {

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            cart.removeIf(item -> item.getProductId().equals(productId));
            session.setAttribute("cart", cart);
            int subtotal = cart.stream()
                    .mapToInt(item -> item.getPrice() * item.getQuantity())
                    .sum();
            session.setAttribute("subtotal", subtotal);
            int totalDiscount = cart.stream()
                    .mapToInt(item -> item.getPrice() * item.getQuantity() * item.getDiscount() / 100)
                    .sum();
            session.setAttribute("totalDiscount", totalDiscount);
            int total = subtotal - totalDiscount;
            session.setAttribute("total", total);
        }

        return "redirect:/cart";
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
