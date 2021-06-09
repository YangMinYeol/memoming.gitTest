package solo.shop.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import solo.common.util.FileUtils;
import solo.shop.goods.dao.GoodsDAO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	
	Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="goodsDAO")
	private GoodsDAO goodsDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override // 최신 상품 리스트
	public List<Map<String, Object>> newGoodsList(Map<String, Object> map) throws Exception { 
		return goodsDAO.newGoodsList(map);
	}

	@Override // 베스트 상품 리스트
	public List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception {
		return goodsDAO.bestGoodsList(map);
	}
	
	@Override // 카테고리별 상품리스트
	public List<Map<String, Object>> cateGoodsList(Map<String, Object> map, String GOODS_CATEGORY2) throws Exception {
		map.put("GOODS_CATEGORY2", GOODS_CATEGORY2);
		System.out.println(GOODS_CATEGORY2);
		return goodsDAO.cateGoodsList(map);
	}
	
	@Override // 상품등록
	public void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception{
		goodsDAO.insertGoods(map);
		System.out.println("상품등록"+map);
		
		map.get("GOODS_SIZE");
		map.get("GOODS_COLOR");
		System.out.println("선택한 컬러=" + map.get("GOODS_COLOR"));
		System.out.println("선택한 사이즈=" + map.get("GOODS_SIZE"));
		
		String Size = map.get("GOODS_SIZE").toString();
		String Color = map.get("GOODS_COLOR").toString();
		String SizeList[] = Size.split(",");
		String ColorList[] = Color.split(",");
		System.out.println(ColorList.length);
		
		// 상품등록시 선택한 사이즈 컬러 개별로 상품옵션 테이블에 등록
		for(int i=0; i <= ColorList.length-1; i++) {
			for(int j=0; j <= SizeList.length-1; j++) {
				System.out.println("배열 = "+ColorList[i]+","+SizeList[j]);
				map.put("GOODS_SIZE", SizeList[j]);
				map.put("GOODS_COLOR", ColorList[i]);
				goodsDAO.goodsAttribute(map);
			}
		}
		System.out.println("옵션="+map);
	}
	
	@Override
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map, HttpServletRequest request) throws Exception{
		System.out.println("map1(IDX)"+map.get("IDX"));
		
		// PK값이 일반적일때
		if(map.get("IDX").getClass().getName().equals("java.lang.String")) {
			Map<String, Object> map1 = new HashMap<String,Object>();
			map1.put("IDX", map.get("IDX"));
			goodsDAO.goodsHitCnt(map1); // 조회수
		}else { // PK값이 배열일때
			String[] Goods_No = (String[])map.get("IDX");
			map.put("IDX", Goods_No[0]);
			goodsDAO.goodsHitCnt(map); // 조회수
		}
		
		System.out.println("map="+map);
		Map<String, Object> resultMap = goodsDAO.selectGoodsDetail(map);
		
		return resultMap;
	}
	@Override  // 상품 상세보기 컬러랑 사이즈 가져오기(배열)
	public Map<String, Object> selectGoodsAtt(Map<String, Object> map) throws Exception {	
		Map<String, Object> resultMap = goodsDAO.selectGoodsAtt(map);
		
		return resultMap;
	}
	
	@Override // 상품디테일에서 장바구니 추가
	public void insertBasket(Map<String, Object> map, HttpServletRequest request) throws Exception {
		map.remove("resultList");
		System.out.println("서비스맵"+map);
		goodsDAO.insertBasket(map);

	}
	
	@Override // 구매리스트 초기화
	public void gumeListDelete(Map<String, Object> map) throws Exception {
		goodsDAO.gumeListDelete(map);
		
	}
	
	@Override // 장바구니 PK값 가져오기	
	public List<Map<String, Object>> selectBasketNo(Map<String, Object> map) throws Exception {
		return goodsDAO.selectBasketNo(map);
	}
	
}
