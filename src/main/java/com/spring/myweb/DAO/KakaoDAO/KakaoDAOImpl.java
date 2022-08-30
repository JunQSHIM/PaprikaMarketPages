package com.spring.myweb.DAO.KakaoDAO;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.KakaoVO.KakaoVO;

@Repository
public class KakaoDAOImpl implements KakaoDAO{
	
	@Inject
	private SqlSession session;

	@Override
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		session.insert("userDB.kakaoInsert",userInfo);
	}

	@Override
	public KakaoVO findkakao(HashMap<String, Object> userInfo) {
		System.out.println("RN:"+userInfo.get("nickname"));
		System.out.println("RE:"+userInfo.get("email"));
		return session.selectOne("userDB.findKakao", userInfo);
	}

}
