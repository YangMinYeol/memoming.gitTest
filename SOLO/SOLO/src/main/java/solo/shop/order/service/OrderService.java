package solo.shop.order.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import solo.common.common.CommandMap;

public interface OrderService {

	// 주문페이지 회원정보
	Map<String, Object> orderMemberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception;
	
	// 주문추가
	void insertOrder(CommandMap commandMap, HttpServletRequest request) throws Exception;

	// 주문완료 페이지
	Map<String, Object> selectOrder(CommandMap commandMap, HttpServletRequest request) throws Exception;

}
