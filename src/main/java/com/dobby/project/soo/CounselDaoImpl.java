package com.dobby.project.soo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CounselDaoImpl implements CounselDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.dobby.project.CounselMapper.";
    @Override   // 회원ID로 회원정보 조회
    public MemberDto selectFromMember(String mbrId) throws Exception{
        return session.selectOne(namespace+"selectFromMember",mbrId);
    }
    @Override   // 상담 게시물 작성
    public void insertCounsel(CounselDto counselDto) throws Exception {
        session.insert(namespace+"insertCounsel", counselDto);
    }
    @Override   // 상담 게시물 작성 중 문의 제품 목록
    public List<ProdDto> selectProdList(Map map) throws Exception {
        return session.selectList(namespace+"selectProdList", map);
    }

    @Override   // 1:1 상담 총 개수
    public int countAllCounsel() throws Exception {
        return session.selectOne(namespace+"countAllCounsel");
    }
    @Override   // 회원별 1:1 상담 개수
    public int countCounselByMember(String MBR_ID) throws Exception {
        return session.selectOne(namespace+"countCounselByMember");
    }
    @Override   // 상품 총 개수
    public int countProd() throws Exception {
        return session.selectOne(namespace+"countProd");
    }
    @Override   // 첨부파일 등록
    public void insertFile(BbsFileDto bbsFileDto) throws Exception {
        session.insert(namespace+"insertFile", bbsFileDto);
    }

    @Override // 회원별 1:1 상담 게시물 + 답변 조회
    public List<CounselAnswerDto> selectListByMember(String mbrId) throws Exception{
        return session.selectList(namespace+"selectListByMember", mbrId);
    }
    @Override // 회원별 1:1 상담 게시물 삭제
    public int deleteCounsel(Integer cnslId) throws Exception{
        return session.delete(namespace+"deleteCounsel", cnslId);
    }

// 여기부터 관리자 페이지
    @Override   // 전체 1:1 상담 + 답변 불러오기
    public List<CounselAnswerDto> selectAllList(Map map) throws Exception {
        return session.selectList(namespace+"selectAllList", map);
    }


    @Override   // 답변 작성
    public void insertAnswer(AnswerDto answerDto) {
        session.insert("insertAnswer", answerDto);
    }

    @Override   // 1:1 상담 상태 업데이트
    public int updateCounselStatus(CounselDto counselDto) throws Exception {
        return session.update(namespace+"updateCounselStatus", counselDto);
    }


    @Override   // 상담번호로 해당 Dto 가져오기
    public CounselDto getCounselByCNSL_ID(Integer CNSL_ID) throws Exception {
        return session.selectOne(namespace + "getCounselByCNSL_ID", CNSL_ID);
    }
}