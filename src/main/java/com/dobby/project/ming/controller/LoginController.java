package com.dobby.project.ming.controller;

import com.dobby.project.ming.dao.UserDao;
import com.dobby.project.ming.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    UserDao userDao;

    @GetMapping("login")
    public String loginForm() {
        return "ming/loginForm";
    }

    @GetMapping("logout")
    public String logout(HttpSession session) {
        // 1. 세션을 종료
        session.invalidate();
        // 2. 홈으로 이동
        return "redirect:/";
    }
    @PostMapping("login")
    public String login(String MBR_ID, String PWD, String toURL, boolean saveid,
                        HttpServletRequest req, HttpServletResponse resp) throws Exception {

        // 1. id와 pwd를 확인
        if (!loginCheck(MBR_ID, PWD)) {
            System.out.println("ID="+MBR_ID+", PW="+PWD);
            System.out.println("로그인 진입 테스트1");
            // 2-1   일치하지 않으면, loginForm으로 이동
            String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8");

            return "redirect:/login?msg=" + msg;
        } else {
            System.out.println("로그인 진입 테스트2");
            // 2-2. id와 pwd가 일치하면,
            //  세션 객체를 얻어오기
            HttpSession session = req.getSession();
            //  세션 객체에 id를 저장
            session.setAttribute("MBR_ID", MBR_ID);

            String referer = req.getHeader("Referer");
            req.getSession().setAttribute("redirectURL", referer);
            String method = req.getMethod();
            System.out.println("from: [" + referer + "]-> " + method + " to: [" + req.getRequestURL() + "]");


            if (saveid) {
                System.out.println("로그인 진입 테스트3");
                //     1. 쿠키를 생성
                Cookie c = new Cookie("MBR_ID", MBR_ID); // ctrl+shift+o 자동 import
//		       2. 응답에 저장
                resp.addCookie(c);
            } else {
                System.out.println("로그인 진입 테스트4");
                // 1. 쿠키를 삭제
                Cookie c = new Cookie("MBR_ID", MBR_ID); // ctrl+shift+o 자동 import
                c.setMaxAge(0); // 쿠키를 삭제
//		       2. 응답에 저장
                resp.addCookie(c);
            }
//		       3. 홈으로 이동
            toURL = toURL == null || toURL.equals("") ? "/" : toURL;
            return "redirect:" + toURL;
        }
    }

    private boolean loginCheck(String MBR_ID, String PWD) throws Exception {
     User user = userDao.selectUser(MBR_ID);

        if(user==null)   return false;

        return user.getPWD().equals(PWD);
	  //return "abcd".equals(MBR_ID) && "1234".equals(PWD);
    }

    @RequestMapping("/findID")
    public String findID(){ return "ming/findID"; }

    @RequestMapping("/findPWD")
    public String findPWD(){ return "ming/findPWD"; }
}
