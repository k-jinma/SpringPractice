package com.example.demo.lecture.validator;

import com.example.demo.lecture.validator.constraints.PostalCode;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import java.util.regex.Pattern;

public class PostalCodeValidator
  implements ConstraintValidator<PostalCode, String> {

  Pattern numeric = Pattern.compile("[0-9-]+");
  Pattern postalCodeFormat = Pattern.compile("\\d{3}-\\d{4}");

  @Override
  public boolean isValid(String value, ConstraintValidatorContext context) {
    // 未入力は検査しない
    if (value == null || value.equals("")) {
      return true;
    }

    // 半角数字ハイフン以外の入力
    if (!numeric.matcher(value).matches()) {
      return false;
    }

    // xxx-xxxxの形式以外の入力
    if (!postalCodeFormat.matcher(value).matches()) {
      return false;
    }

    return true;
  }
}
