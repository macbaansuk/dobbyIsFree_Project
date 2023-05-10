package com.dobby.project.ming.service;

import com.dobby.project.ming.dao.UserDao;
import com.dobby.project.ming.domain.*;
import com.dobby.project.soo.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

public interface UserService {
    int getCount() throws Exception;
    int remove(String MBR_ID) throws Exception;
    List<UserDto> getList() throws Exception;
    UserDto read(String MBR_ID) throws Exception;
    //List<UserDto> getPage(Map map) throws Exception;
    List<UserDto> getPage(Map map) throws Exception;
    int modify(User user) throws Exception;
    // int getSearchResultCnt(SearchCondition sc) throws Exception;
    // List<UserDto> getSearchResultPage(SearchCondition sc) throws Exception;
}

