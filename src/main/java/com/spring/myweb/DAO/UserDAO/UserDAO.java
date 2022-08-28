package com.spring.myweb.DAO.UserDAO;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.UserVO.UserVO;


@Repository("userDAO")
public class UserDAO {

	@Autowired
	private SqlSessionTemplate session;
    	
	// 여러 개 select
		public List<UserVO> selectAll() {
			List<UserVO> userList = session.selectList("userDB.selectUserAll");
			return userList;		
		}
		
		public UserVO select() {
			UserVO vo = session.selectOne("userDB.selectUser");
			return vo;
		}
		
		public int insertUser(UserVO vo) {
			int success = 0;
			success = session.insert("userDB.insertUser", vo); 
			return success;
		}
}