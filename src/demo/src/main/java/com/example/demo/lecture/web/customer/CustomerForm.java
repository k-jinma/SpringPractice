package com.example.demo.lecture.web.customer;

import com.example.demo.lecture.entity.CustomerEntity;
import com.example.demo.lecture.validator.constraints.PhoneNumber;
import com.example.demo.lecture.validator.constraints.PostalCode;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

public class CustomerForm {
  // Formの変数はスネークケースではない
  // 必須のものに@NotEmpty, @NotNullをつける ???二つの違いは？
  // 必須
  @NotEmpty(message = "{validation.field.required}")
  private String name;

  // 必須、半角数字半角ハイフンのみ ?
  @NotEmpty(message = "{validation.field.required}")
  private String postalCode;
  
  // 必須
  @NotEmpty(message = "{validation.field.required}")
  private String address;

  // 必須、半角数字半角ハイフンのみ ?
  @NotEmpty(message = "{validation.field.required}")
  private String phoneNumber;

  public CustomerEntity toEntity() {
    // インスタンス化
    CustomerEntity customer = new CustomerEntity();
    // setIdは使わない ???EntityのsetIdはどこで使われる？
    // Entityに入力された値を渡す
    customer.setName(name);
    customer.setPostalCode(postalCode);
    customer.setAddress(address);
    customer.setPhoneNumber(phoneNumber);
    return customer;
  }

  // 以降 getter,setterのみ

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getPostalCode() {
    return postalCode;
  }

  public void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  public String getPhoneNumber() {
    return phoneNumber;
  }

  public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


}
