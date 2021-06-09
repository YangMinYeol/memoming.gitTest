package solo.shop.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.dao.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO{
	
	// 최신 상품 리스트
	public List<Map<String, Object>> newGoodsList(Map<String,Object> map) throws Exception{
		return (List<Map<String,Object>>) newGoodsList("goods.newGoodsList", map);
	}
	
	// 베스트 상품 리스트
	public List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) bestGoodsList("goods.bestGoodsList", map);
	}

	// 카테고리 상품 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cateGoodsList(Map<String, Object> map) throws Exception {
		System.out.println("카테고리리스트" + map);
		return (List<Map<String, Object>>) selectPagingList("goods.cateGoodsList", map);
	}
	// 상품 등록
	public void insertGoods(Map<String, Object> map) throws Exception {
		insert("goods.goodsInsert", map);
	}
	
	// 상품옵션 등록
	public void goodsAttribute(Map<String, Object> map) throws Exception {
		insert("goods.attributeInsert", map);
	}
	
	// 상품 썸네일 이미지 등록
	public void insertGoodsThumbnail(Map<String, Object> map) throws Exception {
		update("goods.updateGoodsThumbnail", map);
	}
	
	// 상품 이미지파일 등록
	public void insertFile(Map<String, Object> map) throws Exception {
		insert("goods.insertFile", map);
	}
	
	// 상품 디테일에서 좋아요 등록
	public void insertGoodsLike(Map<String, Object> map) throws Exception {
		System.out.println("좋아요" + map);
		insert("goods.insertGoodsLike", map);
	}
	
	// 상품 디테일 데이터 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("goods.selectGoodsDetail", map);
	}

	// 상품옵션 컬러 사이즈 배열 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsAtt(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("goods.selectGoodsAtt", map);
	}
	
	// 조회수 증가
	public void goodsHitCnt(Map<String, Object> map) throws Exception {
		System.out.println("조회수증가=" + map);
		update("goods.goodsReadCntUp", map);
	}
	
	// 상품 디테일에서 장바구니 등록
	public void insertBasket(Map<String, Object> map) throws Exception {
		System.out.println("장바구니추가=" + map);
		insert("goods.insertBasket", map);
	}
	
	// 구매 리스트 초기화
	public void gumeListDelete(Map<String, Object> map) throws Exception {
		System.out.println("구매리스트 삭제:"+map);
		delete("goods.gumeListDelete", map);
	}
	
	// 장바구니 시퀀스번호 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBasketNo(Map<String, Object> map) throws Exception {
		System.out.println("selectBasketNo" + map);
		return (List<Map<String, Object>>) selectList("goods.selectBasketNo", map);
	}
	
}