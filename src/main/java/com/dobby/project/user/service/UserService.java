package com.dobby.project.user.service;

import com.dobby.project.user.domain.*;

import java.util.*;

public interface UserService {
    int getCount() throws Exception;
    int remove(String MBR_ID) throws Exception;
    List<UserDto> getList() throws Exception;
    UserDto read(String MBR_ID) throws Exception;
    List<UserDto> getPage(Map map) throws Exception;
    int modify(User user) throws Exception;
}

