package com.j1703.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
public class CatchHtml {
	 public static List<Integer>  AnlysisHTMLByURL() throws IOException{
	       Document doc= Jsoup.connect("http://192.168.0.112/stat").get();
	       
	       //获取A标签个数
	       //System.out.println("共有超链接："+ doc.getElementsByTag("stream").size());
	       //System.out.println("获取指定ID:"+ doc.getElementById("navigator").html());
	       
	        Elements eles= doc.select("stream name");
	        List< Integer> list = new ArrayList<Integer>();
	        for(Element ele :eles)
	        {
	            String id =  ele.html();
	            list.add(Integer.parseInt(id));
	        }
	        return list;
	    }
	 
	
}
