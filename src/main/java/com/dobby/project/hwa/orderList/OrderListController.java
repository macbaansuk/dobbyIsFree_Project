package com.dobby.project.hwa.orderList;

import com.dobby.project.hwa.order.OrdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OrderListController {

    @Autowired
    private OrderListService orderListService;

 @GetMapping("/order/list")
 public String orderList(HttpServletRequest req, Model m) {
     
     //주문테이블에서 주문일자, 주문번호, 주문상태 가져오기
     HttpSession session = req.getSession();

     String mbrId = (String) session.getAttribute("MBR_ID");
     System.out.println("mbrId = " + mbrId);
     List<OrdDto> ordDto = orderListService.getOrdInfo(mbrId);
     System.out.println("ordDto = " + ordDto);

     m.addAttribute("ordDto",ordDto);

     return "hwa/orderList";
 }

 
 

}
