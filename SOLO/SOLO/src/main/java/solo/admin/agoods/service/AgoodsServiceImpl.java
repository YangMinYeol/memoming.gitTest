package solo.admin.agoods.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import solo.admin.agoods.dao.AgoodsDAO;
import solo.shop.goods.dao.GoodsDAO;

@Service("agoodsService")
public class AgoodsServiceImpl implements AgoodsService{
	
	@Resource(name="agoodsDAO")
	private AgoodsDAO agoodsDAO;
	
	@Resource(name="goodsDAO")
	private GoodsDAO goodsDAO;
	
	public List<Map<String, Object>> aGoodsList(Map<String, Object> map)throws Exception{
		return agoodsDAO.aGoodsList(map);
	}
	
	public void deleteAdminGoods(Map<String, Object> map)throws Exception{
		agoodsDAO.deleteAdminGoodsATT(map);
		agoodsDAO.deleteAdminGoods(map);
	}
	
	@Override
	public void updateGoods(Map<String,Object> map, HttpServletRequest request) throws Exception{
		agoodsDAO.updateGoods(map); // ��ǰ���̺� ������Ʈ
		agoodsDAO.attributeDelete(map); // ���� ��ǰ�� �ִ� �ɼǵ� ����
		
		map.get("GOODS_SIZE");
		map.get("GOODS_COLOR");
		System.out.println("������ �÷�=" + map.get("GOODS_COLOR"));
		System.out.println("������ ������=" + map.get("GOODS_SIZE"));
		
		String Size = map.get("GOODS_SIZE").toString();
		String Color = map.get("GOODS_COLOR").toString();
		String ColorList[] = Color.split(",");
		String SizeList[] = Size.split(",");
		System.out.println(ColorList.length);
		
		for(int i = 0; i <= ColorList.length-1; i++) {
			for(int j = 0; j <= ColorList.length-1; j++) {
				System.out.println("�迭="+ColorList[i]+","+SizeList[j]);
				map.put("GOODS_SIZE", SizeList[j]);
				map.put("GOODS_COLOR", ColorList[i]);
				goodsDAO.goodsAttribute(map); // ��ǰ ������ ������ �÷� ������ �ٽ� ���
			}
		}
	}

}
