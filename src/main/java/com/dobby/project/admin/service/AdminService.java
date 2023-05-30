package com.dobby.project.admin.service;

import com.dobby.project.admin.domain.AdminDto;

public interface AdminService {
    AdminDto AdminloginCheck(String MNGR_ID, String MNGR_PWD) throws Exception;
}
