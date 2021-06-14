package solo.shop.basket.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import solo.common.common.CommandMap;

public interface BasketService {

	//��ٱ��� ����Ʈ
	List<Map<String, Object>> basketList(CommandMap commandMap) throws Exception;

	//��ٱ��� ��������
	void basketModify(CommandMap commandMap, HttpServletRequest request) throws Exception;

	//��ٱ��� ���û���
	void basketDelete(CommandMap commandMap, HttpServletRequest request) throws Exception;

	//��ٱ��� ��ü����
	void basketAllDelete(CommandMap commandMap, HttpServletRequest request) throws Exception;
		
	//��ٱ��� ����Ʈ���� ����
	List<Map<String, Object>> basketSelectList(CommandMap commandMap, HttpServletRequest request) throws Exception;
		
}
