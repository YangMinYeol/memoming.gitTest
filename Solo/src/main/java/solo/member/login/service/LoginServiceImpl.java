package solo.member.login.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import solo.member.login.dao.LoginDAO;

@Service("loginService") // 해당 클래스가 서비스라는것을 알림
public class LoginServiceImpl implements LoginService{
	
	@Resource(name="loginDAO") // autowired와 같은역할 필요로하는 자원을 자동 연결
	private LoginDAO loginDAO;
	
	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		return loginDAO.selectId(map);
	}
	
	@Override
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception {
		return loginDAO.findIdWithEmail(map);
	}
	
	@Override
	public int findId(Map<String, Object> map) throws Exception {
		return loginDAO.findId(map);
	}

	@Override
	public int findPwWithEmail(Map<String, Object> map) throws Exception {
		return loginDAO.findPwWithEmail(map);
	}

	@Override
	public void updateTempPw(Map<String,Object> map) throws Exception {
		loginDAO.updateTempPw(map);
	}
}