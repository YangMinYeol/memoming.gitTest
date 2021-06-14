package solo.shop.order.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import solo.common.common.CommandMap;
import solo.shop.order.dao.OrderDAO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	Logger log = Logger.getLogger(this.getClass()); //로그
	
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;
	
	// 주문페이지 회원정보
	@Override // 재정의
	public Map<String, Object> orderMemberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		return (Map<String, Object>) orderDAO.orderMemberInfo(commandMap);
	}
	
	// 주문테이블 입력
	@Override
	public void insertOrder(CommandMap commandMap, HttpServletRequest request) throws Exception {
		orderDAO.insertOrder(commandMap);
	}
	
	// 주문내역서
	@Override public Map<String, Object> selectOrder(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		return (Map<String, Object>) orderDAO.selectOrder(commandMap); 
	}
}
