package com.dobby.project.hoon.service;

import com.dobby.project.hoon.domain.AdminDto;

public interface AdminService {
    AdminDto AdminloginCheck(String MNGR_ID, String MNGR_PWD) throws Exception;
}
