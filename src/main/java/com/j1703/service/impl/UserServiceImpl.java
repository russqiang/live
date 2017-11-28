package com.j1703.service.impl;


import org.springframework.beans.factory.annotation.Autowired;

import com.j1703.dao.UserDao;
import com.j1703.service.UserService;
import com.j1703.util.FastDFSUtils;
import com.j1703.vo.Anchor;
import com.j1703.vo.User;

public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	//用户登录
	public User userLogin(User user) {
		
		return userDao.userLogin(user);
	}
	//用户注册
	public boolean userRegist(User user) {
		
		return userDao.userRegist(user);
	}
	
	//用户修改
	public boolean updateUser(User user) {
		
		return userDao.updateUser(user);
	}
	
	// 用户关注 在用户focusList 列表中添加liveCode
	public User focus(Anchor anchor, User user) {
		// 得到用户关注主播列表 String
		User u = userDao.getUserById(user);
		String focusList = "";
		if (anchor.getFocusCount() == 1) {
			// liveCode=1 主播人数+1 添加用户关注列表
			focusList = addFocus(u.getFocusList(), anchor.getLiveCode());
		}
		if (anchor.getFocusCount() == -1) {
			// liveCode=-1 主播人数+1 减少用户关注列表 }
			focusList = delFocus(u.getFocusList(), anchor.getLiveCode());
		}
		// 更行用户关注 focusList
		user.setFocusList(focusList);
		userDao.updateUser(user);
		return userDao.getUserById(user);
	}
	
	//添加关注列表
	public String addFocus(String str, int liveCode) {
		StringBuffer sBuffer = new StringBuffer();
		sBuffer.append(str);
		sBuffer.append(liveCode);
		sBuffer.append(",");
		return sBuffer.toString();
	}
	
	//删除关注主播
	public String delFocus(String str, int liveCode) {
		String[] ss = new String[str.length() / 2];
		ss = str.split(",");
		StringBuffer sBuffer = new StringBuffer();
		for (int i = 0; i < ss.length; i++) {
			if (!ss[i].equals(liveCode + "")) {
				sBuffer.append(ss[i] + ",");
			}
		}
		return sBuffer.toString();
	}
	
	//个人中心
	public User getUserById(User user) {
		
		return userDao.getUserById(user);
		
	}
	public User cancelFocus(Anchor anchor, User user) {
		
		// 得到用户关注主播列表 String
		User u = userDao.getUserById(user);
		String focusList = delFocus(u.getFocusList(), anchor.getLiveCode());
		user.setFocusList(focusList);
		userDao.updateUser(user);
		return userDao.getUserById(user);
		
	}
	public String uploadPic(byte[] pic, String name, long size) {
		//上传图片
		return FastDFSUtils.uploadPic(pic, name, size); 
		
	}
	
	
	
	
	
	

}
