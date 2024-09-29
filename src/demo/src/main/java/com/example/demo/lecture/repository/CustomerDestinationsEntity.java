package com.example.demo.lecture.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.lecture.entity.CustomersEntity;

@Repository
public interface CustomerDestinationsEntity extends JpaRepository<CustomersEntity, Long> {}