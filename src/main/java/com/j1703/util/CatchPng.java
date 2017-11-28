package com.j1703.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;

import org.junit.Test;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;

public class CatchPng {
	/*
	 * ffmpeg -i rtmp://live.hkstv.hk.lxdns.com/live/hks -vframes 1 -y -f image2 -t
	 * 1 -s 600x480 /usr/a.jpg -i “rtmp.......... ” ：后接自己的地址 -y
	 * ：覆盖输出文件，即如果1.***文件已经存在的话，不经提示就覆盖掉了 -t 0.001 ：设置纪录时间 hh:mm:ss[.xxx]格式的记录时间也支持
	 * -ss 1 ：延迟1秒后开始 -f image2 ：以图片格式保存 String inFile, String outFile
	 */
	@Test
	public void transfer() {
		/*String url = "rtmp://192.168.200.131' + '/liaohls/1";
		String out = "/usr/a.jpg";
		String command = "ffmpeg -i " + url + " -vframes 1 -y -f image2 -t 1 -s 600x480 " + out;*/
		String command = "ffmpeg" + " -i " + "rtmp://192.168.200.131/liaohls/1 " + " -f image2 -ss 1 -vframes 1 -r 1 -s 400*600 /usr/a.jpg";
		try {
			Process process = Runtime.getRuntime().exec(command);// 执行命令
			InputStreamReader ir = new InputStreamReader(process.getInputStream());
			LineNumberReader input = new LineNumberReader(ir);
			String line;
			while ((line = input.readLine()) != null) {// 输出结果
				System.out.println(line);
			}
		} catch (java.io.IOException e) {
			System.err.println("IOException " + e.getMessage());// 捕捉异常
		}
	
	}
	
	@Test
	public void test()  
    {  
        String hostname = "192.168.200.131";  
        /*String username = "joe";  
        String password = "joespass"; */ 
  
        try  
        {  
            /* Create a connection instance */  
  
            Connection conn = new Connection(hostname);  
  
            /* Now connect */  
  
            conn.connect();  
  
            /* Authenticate. 
             * If you get an IOException saying something like 
             * "Authentication method password not supported by the server at this stage." 
             * then please check the FAQ. 
             */  
  
           /* boolean isAuthenticated = conn.authenticateWithPassword(username, password);  
  
            if (isAuthenticated == false)  
                throw new IOException("Authentication failed."); */ 
  
            /* Create a session */  
  
            Session sess = conn.openSession();  
  
            sess.execCommand("uname -a && date && uptime && who");  
  
            System.out.println("Here is some information about the remote host:");  
  
            /*  
             * This basic example does not handle stderr, which is sometimes dangerous 
             * (please read the FAQ). 
             */  
  
            InputStream stdout = new StreamGobbler(sess.getStdout());  
  
            BufferedReader br = new BufferedReader(new InputStreamReader(stdout));  
  
            while (true)  
            {  
                String line = br.readLine();  
                if (line == null)  
                    break;  
                System.out.println(line);  
            }  
  
            /* Show exit status, if available (otherwise "null") */  
  
            System.out.println("ExitCode: " + sess.getExitStatus());  
  
            /* Close this session */  
  
            sess.close();  
  
            /* Close the connection */  
  
            conn.close();  
  
        }  
        catch (IOException e)  
        {  
            e.printStackTrace(System.err);  
            System.exit(2);  
        }  
    }  
	
	public static void main(String[] args) {  
		  
        for (String arg : args) {  
            System.out.println(arg);  
        }  
  
        ProcessBuilder builder = new ProcessBuilder();  
        builder.command("ffmpeg", "-i", "rtmp://192.168.200.131/liaohls/1", "-f", "image2", "-ss",  
            "0", "-vframes", "1", "-s", "/tmp/fish/a.jpg");  
  
        builder.redirectErrorStream(false);  
        try {  
            Process process = builder.start();  
            InputStream in = process.getInputStream();  
            System.out.println("正在进行截图，请稍候=======================");  
            convertStreamToString(in);  
            System.out.println("");  
            InputStream errorStream = process.getErrorStream();  
            if (errorStream != null && errorStream.read() > 0) {  
                System.out.println("错误：");  
                convertStreamToString(errorStream);  
            }  
            in.close();  
        } catch (IOException e) {  
            System.out.println("错误：");  
            e.printStackTrace();  
        }  
    }  
  
    public static String convertStreamToString(InputStream is) {  
  
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));  
  
        StringBuilder sb = new StringBuilder();  
  
        String line = null;  
  
        try {  
            while ((line = reader.readLine()) != null) {  
                System.out.println(line);  
                sb.append(line + "/n");  
            }  
        } catch (IOException e) {  
  
            e.printStackTrace();  
  
        } finally {  
            try {  
                is.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return sb.toString();  
  
    }  
}
