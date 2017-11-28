package com.j1703.dao;

import com.j1703.vo.User;

public interface UserDao {

	public User userLogin(User user);

	public boolean userRegist(User user);

	public boolean updateUser(User user);

	public User getUserById(User user);

}