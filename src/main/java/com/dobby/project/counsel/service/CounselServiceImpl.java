package com.dobby.project.counsel.service;

import com.dobby.project.counsel.dao.CounselDao;
import com.dobby.project.counsel.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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

    @Override// 회원별 1:1 상담 게시물 삭제
    public int removeCounsel(Integer cnslId) throws Exception {
        return counselDao.deleteCounsel(cnslId);
    }

    //여기부터 관리자 페이지
    @Override // 전체 상담 + 답변 목록 조회
    public List<CounselAnswerDto> getAllList(Map map) throws Exception {
        return counselDao.selectAllList(map);
    }

    @Override   // 답변 작성
    public void writeAnswer(AnswerDto answerDto) throws Exception {
        counselDao.insertAnswer(answerDto);
    }

    @Override // 1:1 상담 답변 후 상태 업데이트
    public int modifyCounselStatus(CounselDto counselDto) throws Exception {
        return counselDao.updateCounselStatus(counselDto);
    }


    @Override   // 답변 작성 + 상태 업데이트
    @Transactional(rollbackFor = Exception.class)
    public void writeAnswerAndModifyStatus(AnswerDto answerDto, CounselDto counselDto) throws Exception {
        counselDao.insertAnswer(answerDto);

        // CNSL_ID를 이용하여 CounselDto 조회
        CounselDto originalCounsel = counselDao.getCounselByCNSL_ID(answerDto.getCNSL_ID());

        // 처리상태와 답변여부 변경
        originalCounsel.setSTUS(counselDto.getSTUS());
        originalCounsel.setANS_YN(counselDto.getANS_YN());

        counselDao.updateCounselStatus(originalCounsel);

    }
}