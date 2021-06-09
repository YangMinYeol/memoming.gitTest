package solo.shop.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.dao.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO{
	
	// �ֽ� ��ǰ ����Ʈ
	public List<Map<String, Object>> newGoodsList(Map<String,Object> map) throws Exception{
		return (List<Map<String,Object>>) newGoodsList("goods.newGoodsList", map);
	}
	
	// ����Ʈ ��ǰ ����Ʈ
	public List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) bestGoodsList("goods.bestGoodsList", map);
	}

	// ī�װ� ��ǰ ����Ʈ
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cateGoodsList(Map<String, Object> map) throws Exception {
		System.out.println("ī�װ�����Ʈ" + map);
		return (List<Map<String, Object>>) selectPagingList("goods.cateGoodsList", map);
	}
	// ��ǰ ���
	public void insertGoods(Map<String, Object> map) throws Exception {
		insert("goods.goodsInsert", map);
	}
	
	// ��ǰ�ɼ� ���
	public void goodsAttribute(Map<String, Object> map) throws Exception {
		insert("goods.attributeInsert", map);
	}
	
	// ��ǰ ����� �̹��� ���
	public void insertGoodsThumbnail(Map<String, Object> map) throws Exception {
		update("goods.updateGoodsThumbnail", map);
	}
	
	// ��ǰ �̹������� ���
	public void insertFile(Map<String, Object> map) throws Exception {
		insert("goods.insertFile", map);
	}
	
	// ��ǰ �����Ͽ��� ���ƿ� ���
	public void insertGoodsLike(Map<String, Object> map) throws Exception {
		System.out.println("���ƿ�" + map);
		insert("goods.insertGoodsLike", map);
	}
	
	// ��ǰ ������ ������ ��������
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("goods.selectGoodsDetail", map);
	}

	// ��ǰ�ɼ� �÷� ������ �迭 ��������
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsAtt(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("goods.selectGoodsAtt", map);
	}
	
	// ��ȸ�� ����
	public void goodsHitCnt(Map<String, Object> map) throws Exception {
		System.out.println("��ȸ������=" + map);
		update("goods.goodsReadCntUp", map);
	}
	
	// ��ǰ �����Ͽ��� ��ٱ��� ���
	public void insertBasket(Map<String, Object> map) throws Exception {
		System.out.println("��ٱ����߰�=" + map);
		insert("goods.insertBasket", map);
	}
	
	// ���� ����Ʈ �ʱ�ȭ
	public void gumeListDelete(Map<String, Object> map) throws Exception {
		System.out.println("���Ÿ���Ʈ ����:"+map);
		delete("goods.gumeListDelete", map);
	}
	
	// ��ٱ��� ��������ȣ ��������
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBasketNo(Map<String, Object> map) throws Exception {
		System.out.println("selectBasketNo" + map);
		return (List<Map<String, Object>>) selectList("goods.selectBasketNo", map);
	}
	
}