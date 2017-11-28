package com.j1703.webSocket;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket/{param}")
public class WebSocketTest {
	// 连接池，用来保存每个客户端连接的对象
	
	//private  static List<CopyOnWriteArraySet<WebSocketTest>> msgLists = Collections.synchronizedList(new ArrayList<CopyOnWriteArraySet<WebSocketTest>>());
	
	private static Map<Integer, CopyOnWriteArraySet<WebSocketTest>> msgLists = new ConcurrentHashMap<Integer, CopyOnWriteArraySet<WebSocketTest>>();
	
	private static CopyOnWriteArraySet<WebSocketTest> msgList = null;
	
	
	// 与某个客户端的连接会话，需要通过它来给客户端发送数据
	private Session session;

	/**
	 * 连接建立成功调用的方法
	 * 
	 * @param session
	 *            可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
	 */
	
	//使用liveCode作为map的key 
	public static CopyOnWriteArraySet<WebSocketTest> getWebSocketTest(Integer liveCode){
		if (msgLists.get(liveCode) == null) {
			msgLists.put(liveCode, new CopyOnWriteArraySet<WebSocketTest>());
		}
		return msgLists.get(liveCode);
	}
	
	@OnOpen
	public void onOpen(Session session,@PathParam(value="param")Integer liveCode) {
		msgList = getWebSocketTest(liveCode);
		this.session = session;
		msgList.add(this);
	}

	/**
	 * 连接关闭调用的方法
	 */
	@OnClose
	public void onClose() {
		msgList.remove(this);
		System.err.println("关闭连接");
	}

	/**
	 * 收到客户端消息后调用的方法
	 * 
	 * @param message
	 *            客户端发送过来的消息
	 * @param session
	 *            可选的参数
	 */
	@OnMessage
	public void onMessage(String message, Session session,@PathParam(value="param")Integer liveCode) {
		System.err.println("来自客户端的消息:" + message);
		// 群发消息
		for (WebSocketTest item : msgLists.get(liveCode)) {
			try {
				item.sendMessage(message);
			} catch (IOException e) {
				e.printStackTrace();
				continue;
			}
		}
	}

	/**
	 * 发生错误时调用
	 * 
	 * @param session
	 * @param error
	 */
	@OnError
	public void onError(Session session, Throwable error) {
		System.err.println("发生错误");
		error.printStackTrace();
	}

	/**
	 * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
	 * 
	 * @param message
	 * @throws IOException
	 */
	public void sendMessage(String message) throws IOException {
		System.err.println("发送消息给客户端");
		this.session.getBasicRemote().sendText(message);// 发送消息给客户端
		// this.session.getAsyncRemote().sendText(message);
	}
}
