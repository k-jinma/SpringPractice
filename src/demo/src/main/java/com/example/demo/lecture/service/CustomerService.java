package com.example.demo.lecture.service;

import com.example.demo.lecture.entity.CustomerEntity;

import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface CustomerService {
  CustomerEntity save(CustomerEntity customer);

  void delete(CustomerEntity customer);

  CustomerEntity findOne(Long id) throws NotFoundException;

  Page<CustomerEntity> findAll(Pageable pageable);
}