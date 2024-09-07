package com.example.demo.lecture.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "customer_destinations")
public class CustomerDestinationsEntity extends BaseEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  // @Column(name = "customer_id")
  // private Long customerId;


  @Column(name = "name")
  private String name;

  @Column(name = "postal_code")
  private String postalCode;

  @Column(name = "address")
  private String address;

  @Column(name = "phone_number")
  private String phoneNumber;

  public void setId(Long id) {
    this.id = id;
  }

  public Long getId() {
    return this.id;
  }

      // テーブルの関係性を定義する。「多」の方。
  @ManyToOne
      // このエンティティのカラム名       // 結合先のエンティティのカラム名
  @JoinColumn(name = "customer_id", referencedColumnName = "id")
  private CustomersEntity customer;

  public void setcustomer(CustomersEntity customer) {
    this.customer = customer;
  }

  public CustomersEntity getcustomer() {
    return customer;
  }


  public void setName(String name) {
    this.name = name;
  }

  public String getName() {
    return this.name;
  }

  public void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  public String getPostalCode() {
    return this.postalCode;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getAddress() {
    return this.address;
  }

  public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  public String getPhoneNumber() {
    return this.phoneNumber;
  }

}
