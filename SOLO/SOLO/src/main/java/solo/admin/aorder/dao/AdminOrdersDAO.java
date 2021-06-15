package solo.admin.aorder.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.common.CommandMap;
import solo.common.dao.AbstractDAO;

@Repository("adminOrdersDAO")
public class AdminOrdersDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMainList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectAdminOrdersList", map);
	}
	
	//admin �ֹ���Ȳ
	public List<Map<String,Object>> order_admin_a(CommandMap map) throws Exception { 
		return (List<Map<String,Object>>) order_admin_a("adminOrder.order_admin_a",map.getMap());
	}
	
	public List<Map<String, Object>> order_detail(CommandMap commandMap) throws Exception {
		return (List<Map<String,Object>>) order_detail("adminOrder.order_detail", commandMap.getMap());
	}

	public List<Map<String, Object>> order_detail_sub(CommandMap commandMap) throws Exception {
		return (List<Map<String,Object>>) order_detail_sub("adminOrder.order_detail_sub", commandMap.getMap());
	}
	
	// �ֹ����� ����
	public void order_state(CommandMap map) throws Exception {
		order_state("adminOrder.order_state",map.getMap());
	}
	
	public void order_state_ex(CommandMap commandMap) throws Exception {
		order_state_ex("adminOrder.order_state_ex",commandMap.getMap());
	}
	
	public List<Map<String, Object>> as_admin_list(CommandMap commandMap) throws Exception {
		return (List<Map<String,Object>>) as_admin_list("adminOrder.as_admin_list", commandMap.getMap());
	}
	
	public void as_cancle_a(CommandMap commandMap) throws Exception {
		as_cancle_a("adminOrder.as_cancle_a",commandMap.getMap());
	}
	
	public void as_ok_state(CommandMap commandMap) throws Exception {
		as_ok_state("adminOrder.as_ok_state",commandMap.getMap());
	}

	public void as_ok_orderState(CommandMap commandMap) throws Exception {
		as_ok_orderState("adminOrder.as_ok_orderState",commandMap.getMap());
	}
}
