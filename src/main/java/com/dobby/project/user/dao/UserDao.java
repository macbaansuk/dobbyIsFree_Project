package com.dobby.project.user.dao;

import com.dobby.project.user.domain.*;
import java.util.*;

public interface UserDao {
    UserDto selectUser(String MBR_ID) throws Exception;
    int deleteUser(String MBR_ID) throws Exception;
    int insertUser(UserDto userDto) throws Exception;
    int updateUser(User user) throws Exception;
    int count() throws Exception;
    String memberDbcheck(String id) throws Exception;
    List<UserDto> selectPage(Map map) throws Exception;
    List<UserDto> memberList() throws Exception;

    void deleteAll() throws Exception;
}