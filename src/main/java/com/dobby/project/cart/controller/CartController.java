package com.dobby.project.cart.controller;

import com.dobby.project.cart.dto.CartProdDto;
import com.dobby.project.cart.service.CartService;
import com.dobby.project.cart.dto.DeleteDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @PostMapping("/cart/{key}")
    @ResponseBody
    public int cartInsert(@PathVariable("key") Integer key, HttpServletRequest req , Model m) {

//        String userKey = "test1";  --임의 mbrId로 테스트

        //------로그인 연동 구현 추가 코드 ---------//
        HttpSession session = req.getSession();
//        System.out.println("session = " + session);

        String mbrId = (String) session.getAttribute("MBR_ID");
//        m.addAttribute("mbrId",mbrId);
        System.out.println("mbrId = " + mbrId);


        // 장바구니에 화면에서 받아온 상품 KEY 랑 세션에서 꺼내온 사용자 KEY를 이용하여 장바구니에 넣는 로직

        //상품 키를 화면에서 받아와서 저장한다
        //키와 유저키만 보낸다

//        System.out.println("key=" + key);

        //저장한 상품키를 jsp로 넘긴다
        int rowCnt = cartService.insertCart(key, mbrId);
//        System.out.println("rowCnt = " + rowCnt);
        return 1;

    }

    @GetMapping("/cart")
    public String selectCart(Model m, HttpServletRequest req) throws Exception {

        HttpSession session = req.getSession();

        String mbrId = (String) session.getAttribute("MBR_ID");
//        System.out.println("mbrId = " + mbrId);


        List<CartProdDto> cartList = cartService.getCartItemByUserKey(mbrId);
        m.addAttribute("cartList", cartList);

        //장바구니 목록을 세션에 담는다
        session.setAttribute("cartList", cartList);
//        System.out.println("cartList = " + cartList);


        return "/cart/cart";
    }

    @PostMapping("/cart/{key}/{quantity}")
    @ResponseBody
    public int addToCart(@PathVariable("key") Integer key, @PathVariable("quantity")  Integer quantity, HttpServletRequest req) {

        HttpSession session = req.getSession();
        String mbrId = (String) session.getAttribute("MBR_ID");
        System.out.println("아이디" + mbrId);
        int rowCnt = cartService.insertCartQty(key, mbrId, quantity);

        return 1;
    }



@PostMapping("/cart/delete") //이 메서드로 수정
@ResponseBody
public  ResponseEntity<Map<String, String>> deleteCartItem(@RequestBody DeleteDto deleteDto) {
//    System.out.println("deletemethod()진입");
//    System.out.println("delete List = " + deleteDto.getCartIdList());

    cartService.deleteCart(deleteDto.getCartIdList());

    Map<String,String> response = new HashMap<>();
    response.put("status","success");


//    return ResponseEntity.ok().body(response);
    return ResponseEntity.ok(response);
//확인요망  -> ok 일때 응답이 어떻게 나오는지

}


    @PostMapping("/cart/update")
    @ResponseBody
    public ResponseEntity<Map<String, String>> updateCartItem(@RequestParam Integer cartId, @RequestParam Integer quantity, HttpSession session) {
//        System.out.println("updateController 진입");
//        System.out.println("cartId= "+ cartId);
//        System.out.println("수량 = " + quantity);


        CartProdDto upCartPdDto = cartService.updateCartQty(cartId, quantity);
//        System.out.println("updatedCartProduct = " + upCartPdDto);


        //장바구니 목록을 세션에 담는다
        List<CartProdDto> cartList = (List<CartProdDto>) session.getAttribute("cartList");

        for (CartProdDto cartItem : cartList) {
            if (cartItem.getCART_ID().equals(cartId)) {
                cartItem.setPROD_INDV_QTY(quantity);
                break;
            }
        }

        session.setAttribute("cartList", cartList);


        int proInvQty = upCartPdDto.getPROD_INDV_QTY(); //구입 수량 input
        int prodAmt = upCartPdDto.getAMT();  //개당 금액
//        System.out.println("prodFee = " + prodAmt);
        
        if (upCartPdDto.getDC_YN().equals("Y")) {  //할인여부가 Y라면 10% 할인
            prodAmt *= 0.9; 
        }
        int prodQuantity = upCartPdDto.getPROD_INDV_QTY(); // 값 구하기 위해서 개별 수량 필요
//        System.out.println("prodQuantity = " + prodQuantity);

        int prodTotal = prodAmt * prodQuantity;  //최종 가격 -> 개당금액 * 수량
//        System.out.println("prodTotal = " + prodTotal);

        int prodPoints = (int) (prodTotal * 0.01); // 적립 포인트는 상품 총 가격의 1%
//        System.out.println("prodPoints = " + prodPoints);

        Map<String, String> map = new HashMap<>();
        map.put("prod_inv_qty", String.valueOf( proInvQty)); // 구입수량 input
        map.put("prod_amt", String.format("%,d", prodAmt)); // json -> 문자열 변환
        map.put("prod_quantity", String.valueOf(prodQuantity));
        map.put("prod_total", String.format("%,d", prodTotal));
        map.put("prod_points", String.format("%,d",prodPoints));
//        map.put("prod_points", String.valueOf(prodPoints));


        return ResponseEntity.ok(map);  //이렇게 delete 수정
        
        //delete 에서 return body 없이 ok로만 전송해봐
    }




}
