package com.j1703.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisDemo {
	
	
	public static void main(String[] args) {
	  ApplicationContext context =  new ClassPathXmlApplicationContext("applicationContext.xml");
	  JedisPool jedisPool = (JedisPool) context.getBean("jedisPool");
	  //获取ShardedJedis对象
      Jedis jedis = jedisPool.getResource();
      //存入键值对
      jedis.set("key2","hello jedis one");
      System.out.println(jedis.get("key2"));
      
   // 操作实体类对象
      Goods good= new Goods();  // 这个Goods实体我就不写了啊
      good.setName( "洗衣机" );
      good.setNum(400);
      good.setPrice(191f);
      jedis.set( "good".getBytes(), SerializeUtil.serialize(good,Goods.class));
      byte[] value = jedis.get( "good".getBytes());
      Object object = SerializeUtil.deSerialize(value,Goods.class);           
       if(object!= null){
           Goods goods=(Goods) object;
           System. out.println(goods.getName());
           System. out.println(goods.getNum());
           System. out.println(goods.getPrice());
      }
      //回收ShardedJedis实例
      jedis.close();
	}
	
	  
}
