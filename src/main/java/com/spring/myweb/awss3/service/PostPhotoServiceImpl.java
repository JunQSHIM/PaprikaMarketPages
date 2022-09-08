package com.spring.myweb.awss3.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.awss3.DAO.PostPhotoDAO;
import com.spring.myweb.awss3.vo.PostPhotoVO;

@Service
public class PostPhotoServiceImpl implements PostPhotoService {

	@Inject
	private PostPhotoDAO postPhotoDAO;
	
	@Override
	public int insertPhoto(PostPhotoVO vo) {
		return postPhotoDAO.insertPhoto(vo);
	}

}
