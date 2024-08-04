package com.example.demo.lecture.validator.constraints;

import com.example.demo.lecture.validator.PhoneNumberValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = PhoneNumberValidator.class)
@Target({ ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface PhoneNumber {
  String message() default "{validation.field.phonenumber}";

  Class<?>[] groups() default {};

  Class<? extends Payload>[] payload() default {};
}
