package com.dobby.project.notice.service;

import com.dobby.project.counsel.domain.SearchCondition;
import com.dobby.project.notice.dao.NoticeDao;
import com.dobby.project.notice.domain.NoticeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    NoticeDao noticeDao;

    @Override
    public int getCount() throws Exception{
        return noticeDao.countAll();
    }


    @Override // 게시물 삭제 + 나중에 String WRTR 추가하기, 관리자 계정(이름)
    public int remove(Integer NB_ID) throws Exception{
        return noticeDao.delete(NB_ID);
    }
    @Override // 게시물 작성
    public int write(NoticeDto noticeDto) throws Exception{
        return noticeDao.insert(noticeDto);
    }
    @Override // 모든 게시물 조회
    public List<NoticeDto> getAllList(Map map) throws Exception{
        return noticeDao.selectAll(map);
    };

    @Override  // 게시물 읽기
    public NoticeDto read(Integer NB_ID) throws Exception{
        NoticeDto noticeDto = noticeDao.select(NB_ID);
//        noticeDao.increaseViewCnt(NB_ID);
        return noticeDto;
    }
//    @Override  // 페이지별 게시물 읽기
//    public List<NoticeDto> getPage(Map map) throws Exception{
//        return noticeDao.selectPage(map);
//    }
    @Override// 게시물 수정
    public int modify(NoticeDto noticeDto) throws Exception{
        return noticeDao.update(noticeDto);
    }

    @Override  // 카테고리별 게시물 조회
    public List<NoticeDto> getListByCate(Map<String, Object> map)throws Exception{
        return noticeDao.selectByCate(map);
    }

    @Override // 카테고리별 게시물 개수
    public int getCountByCate(String BBS_CATE) throws Exception{
        return noticeDao.countByCate(BBS_CATE);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception{
        return noticeDao.searchResultCnt(sc);
    }
    @Override
    public List<NoticeDto> getSearchResultPage(SearchCondition sc) throws Exception{
        return noticeDao.searchSelectPage(sc);
    }

}
