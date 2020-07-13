package com.simple.service;

import com.simple.dao.UserDao;
import com.simple.vo.User;

public class UserService {

	private UserDao userDao = new UserDao();
	
	
	// dao 만든것에 대한 정보를 처리 (유효성검사)	
	public boolean addNewUser(User user) throws Exception {
		User savedUser = userDao.getUserById(user.getId());
		
		// db에 있는 id랑 뽑아온 id 비교
		
		// 있으면 f 없으면 t
		if(savedUser == null ) {
			userDao.insertUser(user);
			return true;
		} else {
			return false;
		}


		
	}
	
	public User loginCheck(String id, String password) throws Exception {
		// 전달받은 아이디로 사용자 정보를 조회
		
		User finduser = userDao.getUserById(id);
		// 사용자 정보가 존재하지 않으면 null 반환
		if (finduser == null) {
			return null;
		}

		// 비밀번호가 일치하지 않으면 null 반환
		if (!password.equals(finduser.getPassword())) {
			return null;
		}

		// 그 외는 조회된 사용자 정보 반환
		return finduser;
	}
	
}
