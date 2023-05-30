package com.dobby.project.ming.dao;


import org.springframework.beans.factory.annotation.Autowired;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import com.dobby.project.ming.domain.*;
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

    //int searchResultCnt(SearchCondition sc) throws Exception;
    //List<UserDto> searchSelectPage(SearchCondition sc) throws Exception;
    void deleteAll() throws Exception;
}