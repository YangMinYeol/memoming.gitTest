package solo.shop.basket.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import solo.common.common.CommandMap;

public interface BasketService {

	//장바구니 리스트
	List<Map<String, Object>> basketList(CommandMap commandMap) throws Exception;

	//장바구니 수량수정
	void basketModify(CommandMap commandMap, HttpServletRequest request) throws Exception;

	//장바구니 선택삭제
	void basketDelete(CommandMap commandMap, HttpServletRequest request) throws Exception;

	//장바구니 전체삭제
	void basketAllDelete(CommandMap commandMap, HttpServletRequest request) throws Exception;
		
	//장바구니 리스트에서 선택
	List<Map<String, Object>> basketSelectList(CommandMap commandMap, HttpServletRequest request) throws Exception;
		
}
