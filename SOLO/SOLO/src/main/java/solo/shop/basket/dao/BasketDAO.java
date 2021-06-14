package solo.shop.basket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.common.CommandMap;
import solo.common.dao.AbstractDAO;

@Repository("basketDAO")
public class BasketDAO extends AbstractDAO{

	// ��ٱ��� ����Ʈ
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketList(CommandMap commandMap) throws Exception{
		return (List<Map<String, Object>>) selectList("basketList.basketList", commandMap.getMap());
	}
	
	// ��ٱ��� ��������
	public void basketModify(CommandMap commandMap) throws Exception{
		update("basketList.basketModify", commandMap.getMap());
	}
	
	// ��ٱ��� ���û���
	public void basketDelete(CommandMap commandMap) throws Exception{
		delete("basketList.basketDelete", commandMap.getMap());
		
	}
	
	// ��ٱ��� ��ü����
	public void basketAllDelete(CommandMap commandMap) throws Exception{
		delete("basketList.basketAllDelete", commandMap.getMap());
	}
	
	// ��ٱ��� ����Ʈ���� ����
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketSelectList(CommandMap commandMap) throws Exception{
		return (List<Map<String, Object>>) selectList("basketList.basketSelectList", commandMap.getMap());
	}
}
