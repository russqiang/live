package com.j1703.util;

import java.util.Set;

import javax.servlet.http.HttpServlet;


import redis.clients.jedis.Jedis;

public class ScreenShot extends HttpServlet implements Runnable{
	
	
	
	static {
		Thread thread = new Thread(new ScreenShot());
		thread.start();
	}

	public void run() {
		while (true) {
			try {
				Thread.sleep(5*1000);
				Jedis jedis = new Jedis("192.168.0.112", 6379);
				Set<String> hkeys = jedis.hkeys("existAnchor");
				for (String string : hkeys) {
					System.out.println(string);
				}
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

	
	
	

}
