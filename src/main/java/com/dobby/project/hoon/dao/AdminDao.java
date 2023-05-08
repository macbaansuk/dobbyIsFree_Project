package com.dobby.project.hoon.dao;

import com.dobby.project.hoon.domain.AdminDto;

public interface AdminDao {
    int count() throws Exception;

    AdminDto loginCheck(AdminDto adminDto) throws Exception;
}
