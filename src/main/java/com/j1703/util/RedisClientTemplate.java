package com.j1703.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;


@Component("redisClientTemplate")
public class RedisClientTemplate {
	
	
	private static final Logger  LOGGER= Logger.getLogger(RedisClientTemplate.class); 
	
	public static <T> List<T>  getResourceFromRedis(String key,Class<T> clazz,JedisPool jedisPool) {
		
		Jedis jedis = jedisPool.getResource();
		Map<byte[], byte[]> hgetAll = jedis.hgetAll(key.getBytes());
		Set<Entry<byte[], byte[]>> entrySet = hgetAll.entrySet();
		List<T> list = new ArrayList<T>();
		for (Entry<byte[], byte[]> entry : entrySet) {
			byte[] data = entry.getValue();
			T t = SerializeUtil.deSerialize(data, clazz);
			list.add(t);
		}
		LOGGER.info(list);
		jedis.close();
		return list;
	}
	
	public static <T> T getResourceFromRedis(String key,Integer liveCode,Class<T> clazz,JedisPool jedisPool) {
		Jedis jedis = jedisPool.getResource();
		byte[] data = jedis.hget(key.getBytes(), String.valueOf(liveCode).getBytes());
		jedis.close();
		return SerializeUtil.deSerialize(data, clazz);
	}
	
}
