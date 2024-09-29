package com.example.demo.lecture.entity;

// import org.glassfish.jaxb.runtime.v2.schemagen.xmlschema.List;
import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "customers")
public class CustomerEntity extends BaseEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  
  @Column(name = "name")
  private String name;

  @Column(name = "postal_code")
  private String postalCode;

  @Column(name = "address")
  private String address;

  @Column(name = "phone_number")
  private String phoneNumber;
  // テーブルの関係性を定義する。「多」のフィールドを追加するだけで「1」のフィールド↑は特に変えない。
  @OneToMany(mappedBy = "customer")
  private List<CustomerDestinationsEntity> customerDestinations;
  // ↑mappeddByの後ろに入るのは関係を持つ「多」のEntity名。sqlのカラムではない！


  public void setCustomerDestinations(List<CustomerDestinationsEntity> customerDestinations) {
    this.customerDestinations = customerDestinations;
  }
  public List<CustomerDestinationsEntity> getCustomerDestinations() {
    return customerDestinations;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getId() {
    return this.id;
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