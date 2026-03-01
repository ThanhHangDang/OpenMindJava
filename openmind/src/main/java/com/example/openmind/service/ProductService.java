package com.example.openmind.service;

import java.util.List;
import com.example.openmind.repository.ProductRepository;
import org.springframework.stereotype.Service;

import com.example.openmind.domain.Product;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }
    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }
    public List<Product> getLatestProducts() {
        return this.productRepository.findTop6ByOrderByIdDesc();
    }
    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }
    public Product saveProduct(Product product) {
        return this.productRepository.save(product);
    }
}
