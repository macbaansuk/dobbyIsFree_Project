package com.dobby.project.soo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CounselServiceImpl implements CounselService {
    @Autowired
    private CounselDao counselDao;

    @Override // 1:1 상담 작성 전 회원 조회
    public MemberDto getMember(String mbrId) throws Exception {
        MemberDto memberDto = counselDao.selectFromMember(mbrId);
        return memberDto;
    }

    @Override // 1:1 상담 작성
    public void writeCounsel(CounselDto counselDto) throws Exception {
        counselDao.insertCounsel(counselDto);
    }

    @Override // 문의 제품 목록 불러오기
    public List<ProdDto> getProdList(Map map) throws Exception {
        return counselDao.selectProdList(map);
    }

    @Override // 1:1 상담 총 개수
    public int getCountAllCounsel() throws Exception {
        return counselDao.countAllCounsel();
    }

    @Override // 회원별 1:1 상담 개수
    public int getCountCounselByMember(String mbrId) throws Exception {
        return counselDao.countCounselByMember(mbrId);
    }

    @Override // 상품 총 개수
    public int getCountProd() throws Exception {
        return counselDao.countProd();
    }

    @Override // 회원별 상담 목록 조회
    public List<CounselAnswerDto> getListByMember(String mbrId) throws Exception {
        return counselDao.selectListByMember(mbrId);
    }

    @Override // 전체 상담 + 답변 목록 조회
    public List<CounselAnswerDto> getAllList(Map map) throws Exception {
        return counselDao.selectAllList(map);
    }

    @Override   // 답변 작성
    public void writeAnswer(AnswerDto answerDto) throws Exception{
        counselDao.insertAnswer(answerDto);
    }




}

