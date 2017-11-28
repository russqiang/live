import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

//每个客户端连接成功的时候在后台都会创建一个相应的MyWebsocket类
@ServerEndpoint("/1websocket")

public class MyWebsocket {

	// concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
	private static CopyOnWriteArraySet<MyWebsocket> websocketPools = new CopyOnWriteArraySet<MyWebsocket>();

	// 与某个客户端的连接会话，需要通过它来给客户端发送数据
	private Session session;

	/**
	 * 连接建立成功调用的方法
	 * 
	 * @param session
	 *            可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
	 */
	@OnOpen
	public void onOpen(Session session) {
		this.session = session;
		websocketPools.add(this);
		System.err.println("新加入连接");
	}

	@OnClose
	public void onClose() {
		websocketPools.remove(this);
		System.err.println("有连接关闭");
	}

	@OnMessage
	public void onMessage(String message, Session session) {
		System.err.println("来自客户端的消息:" + message);
		for (MyWebsocket item : websocketPools) {
			try {
				item.send(message);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void send(String message) throws IOException {
		System.err.println("发送消息给客户端");
		// this.session.getAsyncRemote().sendText(message);
		this.session.getBasicRemote().sendText(message);

	}

	@OnError
	public void onError(Session session, Throwable error) {
		System.out.println("发生错误");
		error.printStackTrace();
	}

}
