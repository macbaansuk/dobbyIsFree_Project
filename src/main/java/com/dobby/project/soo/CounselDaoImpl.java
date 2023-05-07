package com.dobby.project.soo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CounselDaoImpl implements CounselDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.dobby.project.CounselMapper.";
    @Override   // 회원ID로 회원정보 조회
    public MemberDto selectFromMember(String MBR_ID) throws Exception{
        return session.selectOne(namespace+"selectFromMember",MBR_ID);
    }
    @Override   // 상담 게시물 작성
    public void insertCounsel(CounselDto counselDto) throws Exception {
        session.insert("insertCounsel", counselDto);
    }
    @Override   // 상담 게시물 작성 중 문의 제품 목록
    public List<ProdDto> selectProdList(Map map) throws Exception {
        return session.selectList("selectProdList", map);
    }

    @Override   // 1:1 상담 총 개수
    public int countAllCounsel() throws Exception {
        return session.selectOne(namespace+"countCounsel");
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
        session.insert("insertFile", bbsFileDto);
    }

    @Override   // 회원별 상담 목록 조회
    public List<CounselDto> selectListByMemberId(Map map) {
        return session.selectList("selectListByMember", map);
    }

    @Override   // 답변 조회
    public AnswerDto selectAnswerByCnsldId(int CNSL_ID) {

        return session.selectOne("selectFromAnswer", CNSL_ID);
    }
}