package com.example.demo.lecture.service;

import com.example.demo.lecture.entity.CustomerDestinationsEntity;
import com.example.demo.lecture.entity.CustomersEntity;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface CustomersService {
  CustomersEntity findOne(Long id) throws NotFoundException;

  Page<CustomersEntity> findAll(Pageable pageable);

  // Page<CustomerDestinationsEntity> findAllCustomerDestinations(Pageable pageable);
}