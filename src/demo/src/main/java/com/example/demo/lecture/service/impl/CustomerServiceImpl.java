package com.example.demo.lecture.service.impl;

import com.example.demo.lecture.entity.CustomerEntity;
import com.example.demo.lecture.entity.UserEntity;
import com.example.demo.lecture.repository.CustomerRepository;
import com.example.demo.lecture.repository.UserRepository;
import com.example.demo.lecture.service.CustomerService;
import com.example.demo.lecture.service.UserService;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {

  @Autowired
  CustomerRepository customerRepository;

  // @Overrideは書かなくてもいいがシグネチャの間違えをチェックしてくれるので書く
  // 顧客データ登録
  @Override
  public CustomerEntity save(CustomerEntity customer) {
    return customerRepository.save(customer);
  }
   // 顧客データ削除
  @Override
  public void delete(CustomerEntity customer) {
    customerRepository.delete(customer);
  }
  // 顧客詳細表示
  @Override
  public CustomerEntity findOne(Long id) throws NotFoundException {
    // findById → 「@return the entity with the given id...」
    // findById() メソッドは Optional<T> 型を返すことができる
    // Optionalクラスは値が存在するかをisPresent()メソッドを使って確認しNullPointerExceptionを防げる
    Optional<CustomerEntity> customer = customerRepository.findById(id);
    if (!customer.isPresent()) {
      throw new NotFoundException();
      // ???↑NullPointerExceptionではなくNotFoundExceptionの方がいいということ？
    }
    // Optionalクラス の get() メソッドは、Optional の中に値が存在する場合その値を返す
    // 値が存在しない場合には、NoSuchElementException をスロー でも多分上のif文でそれはない?
    return customer.get();
  }
  // 顧客一覧画面
  @Override
  public Page<CustomerEntity> findAll(Pageable pageable) {
    return customerRepository.findAll(pageable);
  }
}
