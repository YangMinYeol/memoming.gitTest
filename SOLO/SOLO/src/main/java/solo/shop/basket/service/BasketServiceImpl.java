package solo.shop.basket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import solo.common.common.CommandMap;
import solo.shop.basket.dao.BasketDAO;

@Service("basketService") // �ش� Ŭ������ ��Ʈ�����̳ʿ� �� ��ü�� �������ִ� ������̼�
public class BasketServiceImpl implements BasketService{

	Logger log = Logger.getLogger(this.getClass()); // �α�
	
	@Resource(name="basketDAO") // ���� �̸��� �̿��ؼ� ������ ��ü�� �˻��Ѵ�
	private BasketDAO basketDAO;
	
	@Override
	public List<Map<String, Object>> basketList(CommandMap commandMap) throws Exception {
		return (List<Map<String, Object>>) basketDAO.basketList(commandMap);
	}

	@Override
	public void basketModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		basketDAO.basketModify(commandMap);
		
	}

	@Override
	public void basketDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		basketDAO.basketDelete(commandMap);
		
	}

	@Override
	public void basketAllDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		basketDAO.basketAllDelete(commandMap);
	}
	

	@Override
	public List<Map<String, Object>> basketSelectList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		return (List<Map<String, Object>>) basketDAO.basketSelectList(commandMap);
	}
}
