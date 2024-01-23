package kr.or.ddit.validate.constraints;

import static java.lang.annotation.ElementType.*;

import java.lang.annotation.Retention;
import static java.lang.annotation.RetentionPolicy.*;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.groups.Default;

@Target(FIELD)
@Retention(RUNTIME)
@Constraint(validatedBy = TelNumberValidator.class)
public @interface TelNumber { //또 하나의 클래스의 형태, 어노테이션이라는 특수한 객체
	String regex() default "\\d{3}-\\d{3,4}-\\d{4}"; 
	String message() default "{kr.or.ddit.validate.constraints.TelNumber.message}";
	Class<?>[] groups() default {};
	Class<?>[] payload() default {}; 
}
