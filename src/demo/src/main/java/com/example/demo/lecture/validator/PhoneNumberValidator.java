package com.example.demo.lecture.validator;

import com.example.demo.lecture.validator.constraints.PhoneNumber;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import java.util.regex.Pattern;

public class PhoneNumberValidator
  implements ConstraintValidator<PhoneNumber, String> {

  final String numeric = "[0-9-]+";
  final String phoneFormat = "\\d{2,3}-\\d{4}-\\d{4}";

  @Override
  public boolean isValid(String value, ConstraintValidatorContext context) {
    if (value == null || value.equals("")) {
      return true;
    }
    if (!Pattern.matches(numeric, value)) {
      return false;
    }
    if (Pattern.matches(phoneFormat, value)) {
      return false;
    }
    return true;
  }
}
