package solo.shop.basket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.common.CommandMap;
import solo.common.dao.AbstractDAO;

@Repository("basketDAO")
public class BasketDAO extends AbstractDAO{

	// 장바구니 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketList(CommandMap commandMap) throws Exception{
		return (List<Map<String, Object>>) selectList("basketList.basketList", commandMap.getMap());
	}
	
	// 장바구니 수량수정
	public void basketModify(CommandMap commandMap) throws Exception{
		update("basketList.basketModify", commandMap.getMap());
	}
	
	// 장바구니 선택삭제
	public void basketDelete(CommandMap commandMap) throws Exception{
		delete("basketList.basketDelete", commandMap.getMap());
		
	}
	
	// 장바구니 전체삭제
	public void basketAllDelete(CommandMap commandMap) throws Exception{
		delete("basketList.basketAllDelete", commandMap.getMap());
	}
	
	// 장바구니 리스트에서 선택
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketSelectList(CommandMap commandMap) throws Exception{
		return (List<Map<String, Object>>) selectList("basketList.basketSelectList", commandMap.getMap());
	}
}
