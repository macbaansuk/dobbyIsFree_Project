package com.dobby.project.notice;

import com.dobby.project.notice.service.NoticeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class NoticeServiceImplTest {

    @Autowired
    NoticeService noticeService;

    @Test
    public void testWrite() throws Exception {
//        NoticeDto noticeDto = new NoticeDto();
//        noticeDto.setBBS_CATE("쇼핑몰 공지");
//        noticeDto.setSTUS("게시중");
//        noticeDto.setTTL("noticeSerive.write() 호출 테스트 성공");
//        noticeDto.setCN("내용입니다.");
//        noticeDto.setWRTR("작성자입니다.");
//
//        int result = noticeService.write(noticeDto);
//        System.out.println("serviceTestresult : " + result);
    }
}