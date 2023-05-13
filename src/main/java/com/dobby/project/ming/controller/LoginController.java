package com.dobby.project.ming.controller;

import com.dobby.project.ming.dao.UserDao;
import com.dobby.project.ming.domain.User;
import com.dobby.project.ming.domain.UserDto;
import com.dobby.project.ming.service.KakaoAccessToken;
import com.dobby.project.ming.service.KakaoUserInfo;
import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.Date;

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
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("login")
    public String login(String MBR_ID, String PWD, String toURL, boolean saveid,
                        HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //id pwd 확인
        if (!loginCheck(MBR_ID, PWD)) {
            String msg = URLEncoder.encode("⚠️아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");
            return "redirect:/login?msg=" + msg;
        }

        HttpSession session = req.getSession();
        session.setAttribute("MBR_ID", MBR_ID);
        session.setMaxInactiveInterval(1800);
        if (saveid) {
            Cookie c = new Cookie("MBR_ID", MBR_ID);
            resp.addCookie(c);
        } else {
            Cookie c = new Cookie("MBR_ID", MBR_ID);
            c.setMaxAge(0);
            resp.addCookie(c);
        }
        toURL = toURL == null || toURL.equals("") ? "/" : toURL;
        return "redirect:" + toURL;
    }


    private boolean loginCheck(String MBR_ID, String PWD) throws Exception {
        UserDto userDto = userDao.selectUser(MBR_ID);
        if (userDto == null) return false;
        return userDto.getPWD().equals(PWD);
    }

    @RequestMapping("/findID")
    public String findID() {
        return "ming/findID";
    }

    @RequestMapping("/findPWD")
    public String findPWD() {
        return "ming/findPWD";
    }

    @RequestMapping("/findIDResult")
    public String findIDResult() {
        return "ming/findIDResult";
    }
    @RequestMapping(value = "/kakaologin", produces = "application/json", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("kakao code=" + code);

        JsonNode accessToken;
        JsonNode jsonToken = KakaoAccessToken.getKakaoAccessToken(code);
        accessToken = jsonToken.get("access_token");
        System.out.println("access_token : " + accessToken);

        JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);

        String MBR_ID = userInfo.path("id").asText();
        String MBR_NM = null;
        String EMAIL = null;

        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");

        MBR_NM = properties.path("nickname").asText();
        EMAIL = kakao_account.path("email").asText();

        System.out.println("id : " + MBR_ID);
        System.out.println("name : " + MBR_NM);
        System.out.println("email : " + EMAIL);

        String dbcheck = userDao.memberDbcheck(MBR_ID);

        if (dbcheck == null) {
            UserDto userDto = new UserDto();
            userDto.setMBR_NM(MBR_NM);
            userDto.setMBR_ID(MBR_ID);
            userDto.setPWD("0000");
            userDto.setBD(new Date());
            userDto.setSEX("0");
            userDto.setEMAIL(EMAIL);
            userDto.setMPNO("0000");
            userDto.setAGRE_YN("0000");

            userDao.insertUser(userDto);

            session = request.getSession();
            session.setAttribute("MBR_ID", MBR_ID);
            session.setMaxInactiveInterval(1800);

            return "ming/registerSuccess";
        } else {
            session = request.getSession();
            session.setAttribute("MBR_ID", MBR_ID);
            session.setMaxInactiveInterval(1800);

            return "redirect:/";
        }
    }
}


