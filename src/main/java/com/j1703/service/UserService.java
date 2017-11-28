package com.j1703.service;

import com.j1703.vo.Anchor;
import com.j1703.vo.User;

public interface UserService {
	
	public User userLogin(User user);

	public boolean userRegist(User user);

	public boolean updateUser(User user);

	public User focus(Anchor anchor, User user);
	
	public User getUserById(User user);

	public User cancelFocus(Anchor anchor, User user);

	public String uploadPic(byte[] bytes, String originalFilename, long size);
}
