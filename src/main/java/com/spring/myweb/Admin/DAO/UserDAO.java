package com.spring.myweb.Admin.DAO;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myweb.Admin.VO.UserVO;


@Repository("userDAO")
public class UserDAO {

	@Autowired
	private SqlSessionTemplate session;
    	
	// 여러 개 select
		public List<UserVO> selectAll() {
			List<UserVO> userList = session.selectList("userDB.selectUserAll");
			return userList;		
		}
}