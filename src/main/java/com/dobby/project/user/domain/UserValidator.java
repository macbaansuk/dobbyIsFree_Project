package com.dobby.project.user.domain;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


public class UserValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }
    @Override
    public void validate(Object target, Errors errors) {

        User user = (User) target;

        String MBR_ID = user.getMBR_ID();
        String PWD = user.getPWD();

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MBR_ID", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "PWD", "required");

        if (MBR_ID == null || MBR_ID.length() < 3 || MBR_ID.length() > 12) {
            errors.rejectValue("MBR_ID", "invalidLength", new String[]{"3", "12"}, null);
        }

        if (PWD == null || PWD.length() < 8 || PWD.length() > 15) {
            errors.rejectValue("PWD", "invalidLength", new String[]{"8", "15"}, null);
        }
    }
}
