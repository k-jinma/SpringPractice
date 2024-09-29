package com.example.demo.lecture.web.customers;

import com.example.demo.lecture.entity.CustomerEntity;
import com.example.demo.lecture.entity.UserEntity;
import com.example.demo.lecture.validator.constraints.PhoneNumber;
import com.example.demo.lecture.validator.constraints.PostalCode;

import jakarta.validation.constraints.NotEmpty;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CustomerEditForm {
  
  @NotEmpty(message = "{validation.field.required}")
  private String name;

  @NotEmpty(message = "{validation.field.required}")
  private String postalCode;
  
  @NotEmpty(message = "{validation.field.required}")
  private String address;

  @NotEmpty(message = "{validation.field.required}")
  private String phoneNumber;

  private String updatedAt;

  public void setEntity(CustomerEntity customer) {
    this.name = customer.getName();
    this.postalCode = customer.getPostalCode();
    this.address = customer.getAddress();
    this.phoneNumber = customer.getPhoneNumber();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(
      "yyyy-MM-dd'T'HH:mm:ss"
    );
    this.updatedAt = customer.getUpdatedAt().format(formatter);
  }

  public void updateEntityAttributes(CustomerEntity customer) {
    customer.setName(name);
    customer.setPostalCode(postalCode);
    customer.setAddress(address);
    customer.setPhoneNumber(phoneNumber);
  }

  // 以下はgetter,setter
  public LocalDateTime getUpdatedAtDateTime() {
    return LocalDateTime.parse(this.updatedAt);
  }

  public String getUpdatedAt() {
    return updatedAt;
  }

  public void setUpdatedAt(String updatedAt) {
    this.updatedAt = updatedAt;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPostalCode() {
    return postalCode;
  }

  public void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getPhoneNumber() {
    return phoneNumber;
  }

  public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }
}
