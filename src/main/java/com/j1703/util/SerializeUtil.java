package com.j1703.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import com.dyuproject.protostuff.LinkedBuffer;
import com.dyuproject.protostuff.ProtobufIOUtil;
import com.dyuproject.protostuff.runtime.RuntimeSchema;

public class SerializeUtil {
	
	public static byte[] serialize(Object object) {
        ObjectOutputStream oos = null;
         ByteArrayOutputStream baos = null;
         try {
              // 序列化
             baos = new ByteArrayOutputStream();
             oos = new ObjectOutputStream(baos);
             oos.writeObject(object);
              byte[] bytes = baos.toByteArray();
              return bytes;
        } catch (Exception e) {

        }
         return null;
  }

   public static Object unserialize( byte[] bytes) {
        ByteArrayInputStream bais = null;
         try {
              // 反序列化
             bais = new ByteArrayInputStream(bytes);
             ObjectInputStream ois = new ObjectInputStream(bais);
             return ois.readObject();
        } catch (Exception e) {

        }
         return null;
         
  }
   
   public static <T> byte[] serialize(T t,Class<T> clazz) {  
       return ProtobufIOUtil.toByteArray(t, RuntimeSchema.createFrom(clazz),  
               LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));  
   }  
   public static <T> T deSerialize(byte[] data,Class<T> clazz) {  
       RuntimeSchema<T> runtimeSchema = RuntimeSchema.createFrom(clazz);  
       T t = runtimeSchema.newMessage();  
       ProtobufIOUtil.mergeFrom(data, t, runtimeSchema);  
       return t;  
   }  
}
