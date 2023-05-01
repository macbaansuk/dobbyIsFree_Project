package com.dobby.project.hwa.order;

import com.dobby.project.hwa.cart.CartProdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/order")
    public String order(@RequestParam("cartIdList") List<Integer> cartIdList, Model m, HttpServletRequest req) {
        System.out.println("orderController 진입");


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
        // -> 주문 상품테이블에서 가져온다  ----> 세션으로 하기로 함

        //장바구니목록을 세션에 담는다
        // 체크된 장바구니 목록의 cart_id를 배열에 담는다.
        // 배열에 담긴 장바구니 아이디와 세션에 담긴 카트아이디를 확인해서
        // 카트아이디가 같은것만 리스트로 보여준다
        // 이로직의 문제점 : 장바구니에서 수량을 변경하면 주문하기에서 목록을 불러올때 수량변경된 값이 적용되지 않는다.
        // update할때  -> 세션에   set수량 다시저장하는걸로 해결



        System.out.println("cartList =" + cartIdList);
        System.out.println("세션"+session.getAttribute("cartList"));
        List<CartProdDto> sessionCartList = (List<CartProdDto>) session.getAttribute("cartList");
        List<CartProdDto> checkedCartList = new ArrayList<>();
        for (CartProdDto cart : sessionCartList) {
            if (cartIdList.contains(cart.getCART_ID())) {
                checkedCartList.add(cart);
            }
        }


        System.out.println("checkedCartList = " + checkedCartList);
        m.addAttribute("orderList",checkedCartList);


        //로그인한 회원의 배송지 목록을 불러온다.
        // 배송지주소록에서 로그인한 회원의 아이디와 일치하는 목록중에서 기본 배송지 여부가 'Y'인것
        // 기본 배송지가 'Y'가 아니라면 불러오지 않는다
        List<DlvDto> dlvsList = orderService.getAddressByMbrId(mbrId);

        List<DlvDto> addressList = new ArrayList<>();
        for (DlvDto dlv : dlvsList) {
            if (dlv.getBASIC_DLVPN_ADD().equals("Y")) {
                addressList.add(dlv);
                break;
            }
        }

        m.addAttribute("addressList", addressList);
        m.addAttribute("dlvsList", dlvsList);

        System.out.println("(배송지List)dlvList=" + dlvsList);
        if (dlvsList.isEmpty()) {
            System.out.println("list is empty");
        }
        System.out.println("(기본배송지)=" + addressList);



        //상품아이디에해당하는
        // 똑같이 배열에 넣는다
        // 베열에 담아서 똑같이 /order 컨트롤러로 값을 넘긴다


    //    m.addAttribute("cartList",cartList);

        return "hwa/order_clone";
    }



@PostMapping("/order/dlv")
@ResponseBody
public ResponseEntity<Map<String, String>> getDlvName(@RequestBody Integer dlvNmId ) {
    System.out.println("order/dlv() 진입");
    System.out.println("dlvNmId= "+dlvNmId);

    //받아온 배송지아이디에 해당하는 배송지목록, 불러오기 (수령자명, 주소, 휴대폰번호)
    DlvDto dlvDto = orderService.getAddressDlvId(dlvNmId);
    System.out.println("dlvDto = " + dlvDto);

    String dlvNm = dlvDto.getDLVPN_NM(); //배송지명
    String rcvNm = dlvDto.getRCPR();  // 수령자명
    System.out.println("수령자명 = " + rcvNm);
    String ordzip = dlvDto.getZPCD();  // 우편번호
    System.out.println("우편번호 = " + ordzip);
    String dlvAddr1st = dlvDto.getBASIC_ADDR();  // 기본주소
    System.out.println("기본주소 = " + dlvAddr1st);
    String dlvAddr2nd = dlvDto.getDTL_ADDR();  // 상세주소
    System.out.println("상세주소 = " + dlvAddr2nd);
    String mblNo = dlvDto.getRCPR_MPNO();  // 휴대폰번호
    System.out.println("휴대폰번호 = " + mblNo);



    Map<String,String> response = new HashMap<>();
        response.put("dlvNm",String.valueOf( dlvNm));
        response.put("rcvNm",String.valueOf( rcvNm));
        response.put("ordzip",String.valueOf( ordzip));
        response.put("dlvAddr1st",String.valueOf( dlvAddr1st));
        response.put("dlvAddr2nd",String.valueOf( dlvAddr2nd));
        response.put("mblNo",String.valueOf( mblNo));

    return ResponseEntity.ok(response);
}


@GetMapping("/pay")
public String paymentTest(){
        return "/hwa/payTest";
}

}
