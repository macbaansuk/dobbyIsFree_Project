package com.dobby.project.hoon.dao;

import com.dobby.project.hoon.domain.InvDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class InvDaoImpl implements InvDao {

    @Autowired
    private SqlSession session;

   private static String namespace="com.dobby.project.hoon.dao.InvMapper.";

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    } // T selectOne(String statement)

    @Override
    public int deleteAll() {
        return session.delete(namespace+"deleteAll");
    } // int delete(String statement)

    @Override
    public int delete(Integer PROD_ID, String PROD_NM) throws Exception {
        Map map = new HashMap();
        map.put("PROD_ID", PROD_ID);
        map.put("PROD_NM", PROD_NM);
        return session.delete(namespace+"delete", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int insert(InvDto dto) throws Exception {
        return session.insert(namespace+"insert", dto);
    } // int insert(String statement, Object parameter)

    @Override
    public List<InvDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    } // List<E> selectList(String statement)

    @Override
    public InvDto select(Integer PROD_ID) throws Exception {
        return session.selectOne(namespace + "select", PROD_ID);
    } // T selectOne(String statement, Object parameter)

    @Override
    public List<InvDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage", map);
    } // List<E> selectList(String statement, Object parameter)

    @Override
    public int update(InvDto dto) throws Exception {
        return session.update(namespace+"update", dto);
    } // int update(String statement, Object parameter)

    @Override
    public int updateInv(InvDto dto) throws Exception {
        return session.update(namespace+"InvUpdate", dto);
    }
    @Override
    public int increaseViewCnt(Integer PROD_ID) throws Exception {
        return session.update(namespace+"increaseViewCnt", PROD_ID);
    }


}
