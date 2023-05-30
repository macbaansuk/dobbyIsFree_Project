package com.dobby.project.admin.dao;

import com.dobby.project.admin.domain.invSearchCondition;
import com.dobby.project.admin.domain.InvDto;

import java.util.List;
import java.util.Map;

public interface InvDao {
    int count() throws Exception // T selectOne(String statement)
    ;

    int deleteAll() // int delete(String statement)
    ;

    int delete(Integer PROD_ID, String PROD_NM) throws Exception // int delete(String statement, Object parameter)
    ;

    int insert(InvDto dto) throws Exception // int insert(String statement, Object parameter)
    ;

    List<InvDto> selectAll() throws Exception // List<E> selectList(String statement)
    ;

    InvDto select(Integer PROD_ID) throws Exception // T selectOne(String statement, Object parameter)
    ;

    List<InvDto> selectPage(Map map) throws Exception // List<E> selectList(String statement, Object parameter)
    ;

    int update(InvDto dto) throws Exception // int update(String statement, Object parameter)
    ;

    int increaseViewCnt(Integer PROD_ID) throws Exception // int update(String statement, Object parameter)
    ;


        int updateInv(InvDto dto) throws Exception;

    int invSearchResultCnt(invSearchCondition sc) throws Exception ;// T selectOne(String statement, Object parameter)
//    ;
//invSearchResultCnt
    List<InvDto> invSearchSelectPage(invSearchCondition sc) throws Exception // List<E> selectList(String statement, Object parameter)
    ;
}
