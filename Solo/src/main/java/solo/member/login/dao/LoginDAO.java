package solo.member.login.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.dao.AbstractDAO;

@Repository("loginDAO") // DAO를 인식시켜주기 위한 설정 해당클래스가 DAO라는것을 알림
public class LoginDAO extends AbstractDAO{
	
	// ID 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId (Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("login.selectId", map);
	}
	
	// 아이디 찾기와 이메일
	@SuppressWarnings("unchecked")
	public Map<String, Object> findIdWithEmail (Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("login.findIdWithEmail", map);
	}
	
	public int findId(Map<String, Object> map) throws Exception{
		return (Integer) selectOne ("login.findId", map);
	}
	
	public int findPwWithEmail (Map<String, Object> map) throws Exception{
		return (Integer) selectOne ("login.findPwWithEmail", map);
	}
	
	public void updateTempPw (Map<String, Object> map) throws Exception{
		update("login.updateTempPw", map);
	}

}
