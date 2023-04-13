package com.dobby.project.soo;

import org.apache.ibatis.javassist.NotFoundException;
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

    // 나중에 String WRTR 추가하기, 관리자 계정(이름)
    @Override
    public int remove(Integer NB_ID) throws Exception{
        return noticeDao.delete(NB_ID);
    }
    @Override
    public int write(NoticeDto noticeDto) throws Exception{

        return noticeDao.insert(noticeDto);
    }
    @Override
    public List<NoticeDto> getList() throws Exception{
        return noticeDao.selectAll();
    };
    @Override
    public NoticeDto read(Integer NB_ID) throws Exception{
        NoticeDto noticeDto = noticeDao.select(NB_ID);
//        noticeDao.increaseViewCnt(NB_ID);
        return noticeDto;
    }
    @Override
    public List<NoticeDto> getPage(Map map) throws Exception{
        return noticeDao.selectPage(map);
    }
    @Override
    public int modify(NoticeDto noticeDto) throws Exception{
        return noticeDao.update(noticeDto);
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
