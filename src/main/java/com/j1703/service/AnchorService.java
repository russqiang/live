package com.j1703.service;

import java.util.List;

import com.j1703.vo.Anchor;

public interface AnchorService {
	
	//主播登录
	public Anchor anchorLogin(Anchor anchor);
	
	//跳转全部直播页面
	public List<Anchor> totalPage();
	
	//跳转首页
	public Anchor indexPage();
	
	// 跳转直播页面
	public Anchor livePage(Integer liveCode);

	public void focus(Anchor anchor);
	
	//根据liveCode获取关注列表所有主播
	public List<Anchor> getAnchorByLiveCode(String focusList);

	//模糊查询主播
	public List<Anchor> searchAnchor(String keyWords);

	//跳转单一分类
	public List<Anchor> getSimpleClassify(Integer id);
}
