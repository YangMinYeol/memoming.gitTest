package solo.shop.order.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import solo.common.common.CommandMap;

public interface OrderService {

	// �ֹ������� ȸ������
	Map<String, Object> orderMemberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception;
	
	// �ֹ��߰�
	void insertOrder(CommandMap commandMap, HttpServletRequest request) throws Exception;

	// �ֹ��Ϸ� ������
	Map<String, Object> selectOrder(CommandMap commandMap, HttpServletRequest request) throws Exception;

}
