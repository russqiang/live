package com.j1703.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.j1703.dao.ClassifyDao;
import com.j1703.service.ClassifyService;
import com.j1703.vo.Classify;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class ClassifyServiceImpl implements ClassifyService{
	
	@Autowired
	private ClassifyDao classifyDao;
	
	@Autowired
	private JedisPool jedisPool;
	
	
	public List<Classify> getAllClassify() {
		Jedis jedis = jedisPool.getResource();
		String classifys = jedis.get("classify");
		List<Classify> list = new ArrayList<Classify>();
		if (classifys != null) {
			list = JSON.parseObject(classifys,new TypeReference<List<Classify>>() {});
			return list;
		}else {
			list = classifyDao.getAllClassify();
			String classify = JSON.toJSONString(list);
			jedis.set("classify", classify);
			return list;
		}
	}

}
