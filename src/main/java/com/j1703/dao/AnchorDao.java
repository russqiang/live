package com.j1703.dao;

import java.util.List;

import com.j1703.vo.Anchor;

public interface AnchorDao {
	
	/* 主播登录 */
	public Anchor anchorLogin(Anchor anchor);
	
	/* 更新关注人数 */
	public boolean addFocusCount(Anchor anchor);

	/* 得到关注列表 */
	public String getFocusList(Anchor anchor);

	/* 更行关注focusList */
	public boolean updateFocusList(Anchor anchor);


	/* 点击房间进入主播房间 */
	public Anchor getAnchor(Anchor anchor);

	// 待修改
	

	/* 得到在线热播主播 */
	public Anchor getHotLive();

	// 待修改
	/* 注册成功添加用户 */
	public boolean insertUser(Anchor anchor);

	

	/* 更新主播信息 */
	public boolean updateAnchor(Anchor anchor);



	public boolean focus(Anchor anchor);

	//根据liveCode获取关注列表所有主播
	public List<Anchor> getAnchorByLiveCode(String[] liveCodes);

	public List<Anchor> searchAnchor(String keyWords);

}
