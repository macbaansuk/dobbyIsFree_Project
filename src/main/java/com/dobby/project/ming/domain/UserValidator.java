package com.dobby.project.ming.domain;

import com.dobby.project.ming.domain.User;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
//		return User.class.equals(clazz); // 검증하려는 객체가 User타입인지 확인
        return User.class.isAssignableFrom(clazz); // clazz가 User 또는 그 자손인지 확인
    }

    @Override
    public void validate(Object target, Errors errors) {
        System.out.println("UserValidator.validate() is called");

        User user = (User)target;

        String MBR_ID = user.getMBR_ID();

//		if(id==null || "".equals(id.trim())) {
//			errors.rejectValue("id", "required");
//		}
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MBR_ID",  "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "PWD", "required");

        if(MBR_ID==null || MBR_ID.length() <  3 || MBR_ID.length() > 12) {
            errors.rejectValue("MBR_ID", "invalidLength", new String[]{"3","12"}, null);
        }
    }
}
