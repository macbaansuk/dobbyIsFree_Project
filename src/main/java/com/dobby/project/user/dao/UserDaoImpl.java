package com.dobby.project.user.dao;

import com.dobby.project.user.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.dobby.project.dao.UserMapper.";

    @Override
    public int deleteUser(String MBR_ID) throws Exception {
        return session.delete(namespace+"deleteUser", MBR_ID);
    }

    @Override
    public List<UserDto> memberList() throws Exception {
        return session.selectList(namespace + "memberList");
    }
    public UserDto selectUser(String MBR_ID) throws Exception {
        return session.selectOne(namespace + "selectUser", MBR_ID);
    }
    @Override
    public List<UserDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage", map);
    }
    @Override
    public int insertUser(UserDto userDto) throws Exception {
        return session.insert(namespace+"insertUser", userDto);
    }
    @Override
    public int updateUser(User user) throws Exception {
        return session.update(namespace+"updateUser", user);
    }
    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }
    @Override
    public String memberDbcheck(String id) throws Exception {
        return session.selectOne(namespace+"memberDbcheck", id);
    }
    @Override
    public void deleteAll() {
    }
}