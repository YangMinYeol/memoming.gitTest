package solo.shop.goods.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface GoodsService {

	// �ֽ� ��ǰ ����Ʈ
	List<Map<String, Object>> newGoodsList(Map<String, Object> map) throws Exception;
	
	// ����Ʈ ��ǰ ����Ʈ
	List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception;
		
	// ī�װ��� ��ǰ��
	List<Map<String, Object>> cateGoodsList(Map<String, Object> map, String GOODS_CATEGORY2) throws Exception;
	
	// ��ǰ ���
	void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception; 
	
	// ��ǰ ������
	Map<String, Object> selectGoodsDetail(Map<String,Object> map, HttpServletRequest request) throws Exception;
	
	// ��ǰ�Ӽ� ������
	Map<String, Object> selectGoodsAtt(Map<String,Object> map) throws Exception;
	
	// ��ٱ��� �߰�
	void insertBasket(Map<String,Object> map, HttpServletRequest request) throws Exception;
	
	// ���Ÿ���Ʈ �ʱ�ȭ
	void gumeListDelete(Map<String, Object> map) throws Exception;
	
	// �����Ҷ� �������� ��������
	List<Map<String, Object>> selectBasketNo(Map<String, Object> map) throws Exception;
	
}
