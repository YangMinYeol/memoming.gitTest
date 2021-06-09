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
	
	Logger log = Logger.getLogger(this.getClass()); // �α�
	
	@Resource(name="goodsDAO")
	private GoodsDAO goodsDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override // �ֽ� ��ǰ ����Ʈ
	public List<Map<String, Object>> newGoodsList(Map<String, Object> map) throws Exception { 
		return goodsDAO.newGoodsList(map);
	}

	@Override // ����Ʈ ��ǰ ����Ʈ
	public List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception {
		return goodsDAO.bestGoodsList(map);
	}
	
	@Override // ī�װ��� ��ǰ����Ʈ
	public List<Map<String, Object>> cateGoodsList(Map<String, Object> map, String GOODS_CATEGORY2) throws Exception {
		map.put("GOODS_CATEGORY2", GOODS_CATEGORY2);
		System.out.println(GOODS_CATEGORY2);
		return goodsDAO.cateGoodsList(map);
	}
	
	@Override // ��ǰ���
	public void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception{
		goodsDAO.insertGoods(map);
		System.out.println("��ǰ���"+map);
		
		map.get("GOODS_SIZE");
		map.get("GOODS_COLOR");
		System.out.println("������ �÷�=" + map.get("GOODS_COLOR"));
		System.out.println("������ ������=" + map.get("GOODS_SIZE"));
		
		String Size = map.get("GOODS_SIZE").toString();
		String Color = map.get("GOODS_COLOR").toString();
		String SizeList[] = Size.split(",");
		String ColorList[] = Color.split(",");
		System.out.println(ColorList.length);
		
		// ��ǰ��Ͻ� ������ ������ �÷� ������ ��ǰ�ɼ� ���̺� ���
		for(int i=0; i <= ColorList.length-1; i++) {
			for(int j=0; j <= SizeList.length-1; j++) {
				System.out.println("�迭 = "+ColorList[i]+","+SizeList[j]);
				map.put("GOODS_SIZE", SizeList[j]);
				map.put("GOODS_COLOR", ColorList[i]);
				goodsDAO.goodsAttribute(map);
			}
		}
		System.out.println("�ɼ�="+map);
	}
	
	@Override
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map, HttpServletRequest request) throws Exception{
		System.out.println("map1(IDX)"+map.get("IDX"));
		
		// PK���� �Ϲ����϶�
		if(map.get("IDX").getClass().getName().equals("java.lang.String")) {
			Map<String, Object> map1 = new HashMap<String,Object>();
			map1.put("IDX", map.get("IDX"));
			goodsDAO.goodsHitCnt(map1); // ��ȸ��
		}else { // PK���� �迭�϶�
			String[] Goods_No = (String[])map.get("IDX");
			map.put("IDX", Goods_No[0]);
			goodsDAO.goodsHitCnt(map); // ��ȸ��
		}
		
		System.out.println("map="+map);
		Map<String, Object> resultMap = goodsDAO.selectGoodsDetail(map);
		
		return resultMap;
	}
	@Override  // ��ǰ �󼼺��� �÷��� ������ ��������(�迭)
	public Map<String, Object> selectGoodsAtt(Map<String, Object> map) throws Exception {	
		Map<String, Object> resultMap = goodsDAO.selectGoodsAtt(map);
		
		return resultMap;
	}
	
	@Override // ��ǰ�����Ͽ��� ��ٱ��� �߰�
	public void insertBasket(Map<String, Object> map, HttpServletRequest request) throws Exception {
		map.remove("resultList");
		System.out.println("���񽺸�"+map);
		goodsDAO.insertBasket(map);

	}
	
	@Override // ���Ÿ���Ʈ �ʱ�ȭ
	public void gumeListDelete(Map<String, Object> map) throws Exception {
		goodsDAO.gumeListDelete(map);
		
	}
	
	@Override // ��ٱ��� PK�� ��������	
	public List<Map<String, Object>> selectBasketNo(Map<String, Object> map) throws Exception {
		return goodsDAO.selectBasketNo(map);
	}
	
}
