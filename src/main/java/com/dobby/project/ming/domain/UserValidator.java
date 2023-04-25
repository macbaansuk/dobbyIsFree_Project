package com.dobby.project.ming.domain;

import com.dobby.project.ming.domain.User;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

//
public class UserValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
//		return User.class.equals(clazz); // 검증하려는 객체가 User타입인지 확인
        return User.class.isAssignableFrom(clazz); // clazz가 User 또는 그 자손인지 확인
    }
    @Override
    public void validate(Object target, Errors errors) { //모든 객체를 검증해야하니 object로
        System.out.println("UserValidator.validate() is called");

        User user = (User) target; //object를 user로 형변환

        String MBR_ID = user.getMBR_ID();
        String PWD = user.getPWD();

//		if(id==null || "".equals(id.trim())) {
//			errors.rejectValue("id", "required");
//		}
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MBR_ID", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "PWD", "required");

        if (MBR_ID == null || MBR_ID.length() < 3 || MBR_ID.length() > 12) {
            errors.rejectValue("MBR_ID", "invalidLength", new String[]{"3", "12"}, null);
        }

        if (PWD == null || PWD.length() < 8 || PWD.length() > 15) {
            errors.rejectValue("PWD", "invalidLength", new String[]{"8", "15"}, null);
        }

        Date BD = user.getBD();

        // 만약 BD 필드가 null이 아니고 형식이 맞지 않는다면
        if (BD != null && !isValidDate(BD)) {
              errors.rejectValue("BD", "invalidDate");
            }
        }

        // 생년월일이 유효한지 확인하는 유틸리티 메소드
        private boolean isValidDate(Date date) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            sdf.setLenient(false);
            String formattedDate = sdf.format(date);
            try {
                Date parsedDate = sdf.parse(formattedDate);
                return parsedDate.equals(date);
            } catch (ParseException e) {
                return false;
            }
        }
    }
