package com.j1703.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.j1703.dao.AnchorDao;
import com.j1703.service.AnchorService;
import com.j1703.util.Constants;
import com.j1703.util.RedisClientTemplate;
import com.j1703.util.SerializeUtil;
import com.j1703.vo.Anchor;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class AnchorServiceImpl implements AnchorService {

	
	@Autowired
	private AnchorDao anchorDao;

	@Autowired
	private JedisPool jedisPool;

	// 主播登录
	public Anchor anchorLogin(Anchor anchor) {

		return anchorDao.anchorLogin(anchor);
	}

	// 跳转首页
	public Anchor indexPage() {
		List<Anchor> anchors = RedisClientTemplate.getResourceFromRedis(Constants.EXISTANCHOR, Anchor.class, jedisPool);
		return anchors.get(0);
	}

	// 跳转全波主播页面
	public List<Anchor> totalPage() {

		return RedisClientTemplate.getResourceFromRedis(Constants.EXISTANCHOR, Anchor.class, jedisPool);
	}

	// 跳转直播页面
	public Anchor livePage(Integer liveCode) {
		
		return RedisClientTemplate.getResourceFromRedis(Constants.EXISTANCHOR, liveCode, Anchor.class, jedisPool);
	}

	// 主播关注功能 主播人数更新
	public void focus(Anchor anchor) {
		// 从缓存中得到主播对象
		anchorDao.focus(anchor);
		Anchor an = anchorDao.getAnchor(anchor);
		// 将主播更新后的数据写入缓存
		if (an.getState() == 1) {
			Jedis jedis = jedisPool.getResource();
			String key = String.valueOf(an.getLiveCode());
			jedis.hset("existAnchor".getBytes(), key.getBytes(), SerializeUtil.serialize(an, Anchor.class));
		}
	}
	
	//根据liveCode获取关注列表所有主播
	public List<Anchor> getAnchorByLiveCode(String focusList) {
		String[] liveCodes = focusList.split(",");
		return anchorDao.getAnchorByLiveCode(liveCodes);
		
	}
	
	//模糊查询主播
	public List<Anchor> searchAnchor(String keyWords) {

		return anchorDao.searchAnchor(keyWords);
	}
	
	//跳转单一分类
	public List<Anchor> getSimpleClassify(Integer id) {
		List<Anchor> totalAnchor = totalPage();
		List<Anchor> liveAnchor = new ArrayList<Anchor>();
		for (Anchor anchor : totalAnchor) {
			if (anchor.getTypeId().equals(id)) {
				liveAnchor.add(anchor);
			}
		}
		return liveAnchor;
	}

}
