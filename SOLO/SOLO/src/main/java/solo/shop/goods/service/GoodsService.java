package solo.shop.goods.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface GoodsService {

	// 최신 상품 리스트
	List<Map<String, Object>> newGoodsList(Map<String, Object> map) throws Exception;
	
	// 베스트 상품 리스트
	List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception;
		
	// 카테고리별 상품순
	List<Map<String, Object>> cateGoodsList(Map<String, Object> map, String GOODS_CATEGORY2) throws Exception;
	
	// 상품 등록
	void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception; 
	
	// 상품 디테일
	Map<String, Object> selectGoodsDetail(Map<String,Object> map, HttpServletRequest request) throws Exception;
	
	// 상품속성 디테일
	Map<String, Object> selectGoodsAtt(Map<String,Object> map) throws Exception;
	
	// 장바구니 추가
	void insertBasket(Map<String,Object> map, HttpServletRequest request) throws Exception;
	
	// 구매리스트 초기화
	void gumeListDelete(Map<String, Object> map) throws Exception;
	
	// 구매할때 시퀀스값 가져오기
	List<Map<String, Object>> selectBasketNo(Map<String, Object> map) throws Exception;
	
}
