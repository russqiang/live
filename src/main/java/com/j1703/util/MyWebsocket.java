package com.j1703.util;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;


//ÿ���ͻ������ӳɹ���ʱ���ں�̨���ᴴ��һ����Ӧ��MyWebsocket��
//@ServerEndpoint("/websocket")
public class MyWebsocket {

	// concurrent�����̰߳�ȫSet���������ÿ���ͻ��˶�Ӧ��MyWebSocket������Ҫʵ�ַ�����뵥һ�ͻ���ͨ�ŵĻ�������ʹ��Map����ţ�����Key����Ϊ�û���ʶ
	private static CopyOnWriteArraySet<MyWebsocket> websocketPools = new CopyOnWriteArraySet<MyWebsocket>();

	// ��ĳ���ͻ��˵����ӻỰ����Ҫͨ���������ͻ��˷�������
	private Session session;

	/**
	 * ���ӽ����ɹ����õķ���
	 * 
	 * @param session
	 *            ��ѡ�Ĳ�����sessionΪ��ĳ���ͻ��˵����ӻỰ����Ҫͨ���������ͻ��˷�������
	 */
	@OnOpen
	public void onOpen(Session session) {
		this.session = session;
		websocketPools.add(this);
	}

	@OnClose
	public void onClose() {
		websocketPools.remove(this);
	}

	@OnMessage
	public void onMessage(String message, Session session) {
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
		this.session.getAsyncRemote().sendText(message);
		// this.session.getBasicRemote().sendText(message);

	}

	@OnError
	public void onError(Session session, Throwable error) {
		System.out.println("��������");
		error.printStackTrace();
	}

}