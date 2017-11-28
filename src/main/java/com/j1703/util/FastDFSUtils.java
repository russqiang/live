package com.j1703.util;

import org.apache.commons.io.FilenameUtils;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.springframework.core.io.ClassPathResource;

/**
 * 上传图片到FastDFS
 * @author admin
 *
 */
public class FastDFSUtils {
	
	//图片服务器
	public static final String IMG_URL = "http://192.168.0.112:81/";
	
	public static String uploadPic(byte[] pic,String name,Long size){
		
		//clientGlobe 读取配置文件
		String path = null;
		ClassPathResource resource = new ClassPathResource("fdfs_client.conf");
		try {
			ClientGlobal.init(resource.getClassLoader().getResource("fdfs_client.conf").getPath());
			//创建老大客户端
			TrackerClient trackerClient = new TrackerClient();
			TrackerServer trackerServer = trackerClient.getConnection();
			//StorageClient storageClient = new StorageClient(trackerServer, null);
			StorageClient1 storageClient1 = new StorageClient1(trackerServer, null);
			String ext = FilenameUtils.getExtension(name);
			NameValuePair[] meta_list = new NameValuePair[3];
			meta_list[0] = new NameValuePair("fileName",name);
			meta_list[1] = new NameValuePair("fileExt",ext);
			meta_list[2] = new NameValuePair("fileSize",String.valueOf(size));
			path = storageClient1.upload_file1(pic, ext, meta_list);
			System.err.println("path---------"+path);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return IMG_URL+path;
	}
}
