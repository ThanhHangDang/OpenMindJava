package com.example.openmind.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.openmind.domain.Category;
import com.example.openmind.repository.CategoryRepository;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> countProductsByCategory() {
        return this.categoryRepository.findAll();
    }
}
