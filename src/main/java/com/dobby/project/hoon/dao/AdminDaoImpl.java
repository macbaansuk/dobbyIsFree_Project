package com.dobby.project.hoon.dao;

import com.dobby.project.hoon.domain.AdminDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private SqlSession session;

    private static String namespace="com.dobby.project.hoon.dao.AdminLoginMapper.";

    @Override
    public int count() throws Exception{
        return session.selectOne(namespace+"count");
    }
    @Override
    public AdminDto loginCheck(AdminDto adminDto) throws  Exception {
        return session.selectOne(namespace+"loginCheck", adminDto);
    }
}
