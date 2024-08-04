package com.example.demo.lecture.validator.constraints;

import com.example.demo.lecture.validator.PostalCodeValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

// 対象とするクラス
@Constraint(validatedBy = PostalCodeValidator.class)
// アノテーションを付与する対象
@Target({ ElementType.FIELD })
// アノテーションの有効なタイミング
@Retention(RetentionPolicy.RUNTIME)
public @interface PostalCode {
  // 下記属性3つはデフォルトのもの
  String message() default "{validation.field.postalcode}";

  Class<?>[] groups() default {};

  Class<? extends Payload>[] payload() default {};
}
