package com.dobby.project.hwa.order;

import com.dobby.project.hwa.cart.CartDto;
import com.dobby.project.hwa.cart.CartProdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

@PostMapping("/order")
public String placeOrder(@RequestParam("cartIdList") List<Integer> cartIdList, Model m, HttpServletRequest req) {
//    public String placeOrder(@ModelAttribute OrderDto orderDto, Model m) {
    System.out.println("orderController 진입");

//    OrderDto orderDto = new OrderDto();
//    orderDto.setCartIdList(cartIdList);
//    System.out.println("orderDto = "+ orderDto.getCartIdList());
//
//    List<CartDto> cartList = orderService.selectCartOrder(orderDto.getCartIdList());
//    System.out.println("chkCartList = " + cartList);





    // 회원아이디 조회
    // -> 회원 테이블에서 가져온다
    // 세션 아이디로 해당하는 회원의 정보를가져온다
    // 해당회원의 장바구니가 맞는지 확인
    // -> 장바구니 아이디 랑 회원의 아이디랑 맞는지 비교하고 select

    HttpSession session = req.getSession();

    String mbrId = (String) session.getAttribute("MBR_ID");

    MbrDto mbrDto = orderService.getMbrInfoById(mbrId);

    System.out.println("mbrDto = " + mbrDto);

    //세션아이디랑 멤버테이블의 아이디랑 같은지 비교를 해야하는건지
    // 카트테이블의 아이디랑 비교를 해야하는건지 모르겟네

    m.addAttribute("mbrDto", mbrDto);
//    m.addAttribute("orderDto", cartList);







    //상품 정보 조회
    // -> 장바구니에서 가져온 카트 아이디값을 상품 테이블과 조인한다
    // -> 조인한 값을 주문상품테이블에 저장한다
    // -> 주문 상품테이블에서 가져온다

    //장바구니목록을 세션에 담는다
    // 체크된 장바구니 아이디를 배열에 담는다.
    // 배열에 담긴 장바구니 아이디와 세션에 담긴 카트아이디를 확인해서
    // 카트아이디가 같은것만 리스트로 보여준다

    System.out.println("cartList =" + cartIdList);
    List<CartProdDto> checkedCartList = new ArrayList<>();
    List<CartProdDto> sessionCartList = (List<CartProdDto>) session.getAttribute("cartList");
    for (CartProdDto cart : sessionCartList) {
        if (cartIdList.contains(cart.getCART_ID())) {
            checkedCartList.add(cart);
        }
    }

    System.out.println("checkedCartList = " + checkedCartList);
    m.addAttribute("orderList",checkedCartList);


    //상품아이디에해당하는
    // 똑같이 배열에 넣는다
    // 베열에 담아서 똑같이 /order 컨트롤러로 값을 넘긴다






//    m.addAttribute("cartList",cartList);

    return "hwa/order_clone";
}






    }