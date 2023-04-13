package com.dobby.project.hwa.cart;

import com.dobby.project.sun.ProductDCDto;
import com.dobby.project.sun.ProductDto;
import com.dobby.project.sun.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @PostMapping("/cart/{key}")
    @ResponseBody
    public int main(@PathVariable("key") String key) {
        System.out.println("main Carrt 컨트롤러 진입");
        String userKey = "1";
        // 장바구니에 화면에서 받아온 상품 KEY 랑 세션에서 꺼내온 사용자 KEY를 이용하여 장바구니에 넣는 로직

        //상품 키를 화면에서 받아와서 저장한다
        //키와 유저키만 보낸다

        System.out.println("key=" + key);
        System.out.println("us key=" + userKey);

        //저장한 상품키를 jsp로 넘긴다
        int rowCnt = cartService.insertCart(key, userKey);

//        System.out.println("마지막 post");
        return 1;

    }

    @GetMapping("/cart")
    public String selectCart(Model m) throws Exception {
        String userKey = "1";
        List<CartProdDto> cartList = cartService.getCartItemByUserKey(userKey);
        m.addAttribute("cartList", cartList);
//        System.out.println("여기서 안되는데");
//        System.out.println("list="+ cartList);



//        System.out.println("여기는 프로덕트 리스트"+ ProductsMain);
//        System.out.println("여기는 프로덕트 할인 리스트"+ Products_DC);

        return "hwa/cart_real";
    }



    @PostMapping ("/cart/delete")
    @ResponseBody
    public void deleteCartItem(@RequestBody DeleteDto deleteDto) {
        System.out.println("deletemethod()진입");
        System.out.println("delete List = " + deleteDto.getCartIdList());

//        System.out.println(prodNo);
        String userKey = "1";
        cartService.deleteCart(deleteDto.getCartIdList());
    }


    @PostMapping("/cart/update")
    @ResponseBody
    public void updateCartItem(@RequestParam Integer cartId, @RequestParam Integer quantity) {
        System.out.println("updateController 진입");
        System.out.println("cartId= "+ cartId);
        System.out.println("수량 = " + quantity);
        
        cartService.updateCartQty(cartId,quantity);



////        String userKey = "1";
//        cartService.updateCartQuantity( cartId, quantity);
    }




}
