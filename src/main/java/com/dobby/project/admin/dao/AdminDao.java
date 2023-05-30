package com.dobby.project.admin.dao;

import com.dobby.project.admin.domain.AdminDto;

public interface AdminDao {
    int count() throws Exception;

    AdminDto loginCheck(AdminDto adminDto) throws Exception;
}
