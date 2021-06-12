package solo.admin.agoods.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AgoodsService {

	List<Map<String, Object>> aGoodsList(Map<String, Object> map)throws Exception;
	
	void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void deleteAdminGoods(Map<String, Object> map) throws Exception;
	
}
