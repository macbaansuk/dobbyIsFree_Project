package com.dobby.project.ming.dao;

import com.dobby.project.ming.domain.User;

public interface UserDao {
    User selectUser(String MBR_ID) throws Exception;
    int deleteUser(String MBR_ID) throws Exception;
    int insertUser(User user) throws Exception;
    int updateUser(User user) throws Exception;
    int count() throws Exception;
    void deleteAll() throws Exception;
}