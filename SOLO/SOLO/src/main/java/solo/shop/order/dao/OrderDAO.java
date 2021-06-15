package solo.shop.order.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.common.CommandMap;
import solo.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO{
	
	// 주문페이지 회원정보
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderMemberInfo(CommandMap commandMap) throws Exception{
		return (Map<String, Object>) selectOne("order.orderMemberInfo", commandMap.getMap());
	}
	
	// Order테이블 Insert
	public void insertOrder(CommandMap commandMap) throws Exception{
		insert("order.insertOrder", commandMap.getMap());
		
		// 주문한 상품의 종류가 한개일 때
		if(commandMap.get("GOODS_NUM").getClass().getName().equals("java.lang.String")) {
			Map<String, Object> dp = new HashMap<String, Object>();
			dp.put("ORDER_DETAIL_GNUM", commandMap.get("GOODS_NUM"));
			dp.put("GOODS_ATT_NO", commandMap.get("GOODS_ATT_NO"));
			dp.put("ORDER_PRICE", commandMap.get("ORDER_PRICE"));
			dp.put("ORDER_TCOST", commandMap.get("ORDER_TCOST"));
			dp.put("ORDER_DETAIL_COLOR", commandMap.get("GOODS_COLOR"));
			dp.put("ORDER_DETAIL_SIZE", commandMap.get("GOODS_SIZE"));
			dp.put("ORDER_DETAIL_AMOUNT", commandMap.get("GOODS_ATT_AMOUNT"));
			dp.put("ORDER_USER_NUM", commandMap.get("ORDER_USER_NUM"));
			
			insert("order.insertOrderDetail", dp);
			update("goods.updateGoodsAmount", dp);
			update("goods.updateGoodsDisplay", dp);
			
			Map<String, Object> bod = new HashMap<String, Object>();
			bod.put("BASKET_NUM", commandMap.get("BASKET_NUN"));
			bod.put("GOODS_ATT_NO", commandMap.get("GOODS_ATT_NO"));
			bod.put("MEM_NUM", commandMap.get("ORDER_USER_NUM"));
			delete("basketList.basketOrderDelete", bod);
		} else { // 주문한 상품의 종류가 두개 이상일 때 배열로 받는다
			String[] ORDER_DETAIL_GNUM = (String[])commandMap.getMap().get("GOODS_NUM");
			String[] GOODS_ATT_NO = (String[])commandMap.getMap().get("GOODS_ATT_NO");
			String[] ORDER_DETAIL_COLOR = (String[])commandMap.getMap().get("GOODS_COLOR");
			String[] ORDER_DETAIL_SIZE = (String[])commandMap.getMap().get("GOODS_SIZE");
			String[] ORDER_DETAIL_AMOUNT = (String[])commandMap.getMap().get("GOODS_ATT_AMOUNT");
			String[] BASKET_NUM = (String[])commandMap.getMap().get("BASKET_NUM");
			
			String a = Arrays.toString(BASKET_NUM).replace("[", "");
			a = a.replace("]", "");
			String b = Arrays.toString(GOODS_ATT_NO).replace("[", "");
			b = b.replace("]", "");
			
			int len = BASKET_NUM.length;
			for(int i=0; i < len; i++ ) {
				Map<String, Object> dp = new HashMap<String, Object>();
				dp.put("ORDER_DETAIL_GNUM", ORDER_DETAIL_GNUM[i]);
				dp.put("GOODS_ATT_NO", GOODS_ATT_NO[i]);
				dp.put("ORDER_DETAIL_COLOR", ORDER_DETAIL_COLOR[i]);
				dp.put("ORDER_DETAIL_SIZE", ORDER_DETAIL_SIZE[i]);
				dp.put("ORDER_DETAIL_AMOUNT", ORDER_DETAIL_AMOUNT[i]);
				dp.put("ORDER_PRICE",commandMap.get("ORDER_PRICE")); 
				dp.put("ORDER_TCOST",commandMap.get("ORDER_TCOST")); 
				dp.put("ORDER_USER_NUM",commandMap.get("ORDER_USER_NUM"));
				
				insert("order.insertOrderDetail", dp);
				update("goods.updateGoodsAmount", dp);
				update("goods.updateGoodsDisplay", dp);
			}
			Map<String, Object> bod = new HashMap<String, Object>();
			bod.put("MEM_NUM", commandMap.get("ORDER_USER_NUM"));
			bod.put("BASKET_NUM", a);
			bod.put("GOODS_ATT_NO", b);
			delete("basketList.basketOrderDelete", bod);
		}
		insert("order.insertAdmin", commandMap.getMap());
	}
	
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectOrder(CommandMap commandMap) { 
		return (Map<String, Object>) selectOne("order.selectOrder", commandMap.getMap()); 
	}
}