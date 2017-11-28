package com.j1703.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.junit.Test;

public class CatchFFMPEG {
	public static void main(String[] args) {  
		  
        for (String arg : args) {  
            System.out.println(arg);  
        }  
  
        ProcessBuilder builder = new ProcessBuilder();  
        builder.command("ffmpeg", "-i", "rtmp://192.168.0.112/hls/1004","-vframes", "1","-y", "-f", "image2", "-r",  
            "1",  "-s", "320*180", "/tmp/a.jpg");  
  
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
	
	@Test
	public void test2() { 
		
		//String raw2flvCmd = "/usr/local/ffmpeg/bin/ffmpeg -i \"某视频文件下载URL\" -f flv /usr/userfile/ffmpeg/tempfile/1.flv";  
		String raw2flvCmd = "/usr/local/nginx/ffmpeg/bin/ffmpeg -i \"rtmp://192.168.0.112/hls/1004\" -vframes 1 -y -f image2  -r 1 -s 320x180 /tmp/a1.jpg";
		try {
			Runtime.getRuntime().exec(new String[]{"sh","-c",raw2flvCmd});
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	
	@Test
	public void test() {
		String command = "/usr/local/nginx/ffmpeg/bin/ffmpeg -i \"rtmp://192.168.0.112/hls/1004\" -vframes 1 -y -f image2  -r 1 -s 320x180 /tmp/a1.jpg";
		ProcessBuilder builder = new ProcessBuilder(command);  
        builder.command(command);  
        try {
			builder.start();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  
        //builder.redirectErrorStream(false);  
        /*try {  
            Process process = builder.start();  
            //InputStream in = process.getInputStream();  
            System.out.println("正在进行截图，请稍候=======================");  
            //convertStreamToString(in);  
            System.out.println("");  
            InputStream errorStream = process.getErrorStream();  
            if (errorStream != null && errorStream.read() > 0) {  
                System.out.println("错误：");  
                convertStreamToString(errorStream);  
            }  
            //in.close();  
        } catch (IOException e) {  
            System.out.println("错误：");  
            e.printStackTrace();  
        }  */
	}
	
	public void test1() {
		Runtime runtime = Runtime.getRuntime();
		Process proc = null;
		String cmd = "/usr/local/nginx/ffmpeg/bin/ffmpeg -i \"rtmp://192.168.0.112/hls/1004\" -vframes 1 -y -f image2  -r 1 -s 320x180 /tmp/a1.jpg";
		/*try {
			proc = runtime.exec(cmd);
			ProcessBuilder builder = new ProcessBuilder(commend); 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
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
