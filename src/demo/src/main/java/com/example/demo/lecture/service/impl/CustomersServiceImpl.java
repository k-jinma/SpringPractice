package com.example.demo.lecture.service.impl;

import com.example.demo.lecture.entity.CustomersEntity;
import com.example.demo.lecture.entity.CustomerDestinationsEntity;
import com.example.demo.lecture.repository.CustomersRepository;
import com.example.demo.lecture.service.CustomersService;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class CustomersServiceImpl implements CustomersService {

  @Autowired
  CustomersRepository customersRepository;

  //顧客一覧画面
  @Override
  public Page<CustomersEntity> findAll(Pageable pageable) {
    return customersRepository.findAll(pageable);
  }
  
  //顧客詳細画面
  @Override
  public CustomersEntity findOne(Long id) throws NotFoundException {

    Optional<CustomersEntity> customer = customersRepository.findById(id);
    if (!customer.isPresent()) {
      throw new NotFoundException();
    }
    return customer.get();
  }



//顧客配送先詳細
  // @Override
  // public Page<CustomerDestinationsEntity> findAllCustomerDestinations(Pageable pageable) {
  //   return customersRepository.findAll(pageable);
  // }
}
