package com.example.openmind.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.openmind.domain.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    List<Category> findAll();
    
}
