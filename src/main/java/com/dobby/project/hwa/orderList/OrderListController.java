package com.dobby.project.hwa.orderList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderListController {

 @GetMapping("/order/list")
 public String orderList() {
     return "hwa/orderList";
 }


}
