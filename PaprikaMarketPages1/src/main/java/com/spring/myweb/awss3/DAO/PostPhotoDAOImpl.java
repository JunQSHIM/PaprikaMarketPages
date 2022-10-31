package com.spring.myweb.awss3.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.awss3.vo.PostPhotoVO;

@Repository
public class PostPhotoDAOImpl implements PostPhotoDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public int insertPhoto(PostPhotoVO vo) {
		int success = 0;
		session.insert("userDB.insertPhoto", vo);
		return success;
	}

}
