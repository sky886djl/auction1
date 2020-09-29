package com.auction.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	/**
	 * 上传文件
	 * 
	 * @param files
	 * @throws Exception
	 */
	public static String uploadFile(MultipartFile file, String pic_path) throws Exception {
		// 1图片存储的路径
		String newfileName = DateFormat.format(new Date()) + UUID.randomUUID() + ".jpg";
		//2 copy
		saveFileFromInputStream(file.getInputStream(),pic_path,newfileName);
		return newfileName;
	}

	public static void saveFileFromInputStream(InputStream stream, String path, String filename) throws IOException {
		FileOutputStream fs = new FileOutputStream(path + filename);
		byte[] buffer = new byte[1024 * 1024];
		int byteread = 0;
		while ((byteread = stream.read(buffer)) != -1) {
			fs.write(buffer, 0, byteread);
		}
		fs.flush();
		fs.close();
		stream.close();
	}


	public static void main(String[] args) {
//		String originalFilename = "sdsds.jpg";
//		// 3新名称(uuid随机数加上后缀名)
//		Date date = new Date();
//		String newfileName = DateFormat.format(new Date()) + UUID.randomUUID() + ".jpg";
//
//		System.out.println(newfileName);
//		List<Comment> list=new ArrayList<>();
//		Comment comment=new Comment();
//		comment.setCommentTime(new Date(2018,12,11));
//		comment.setId(1);
//		list.add(comment);
//		 comment=new Comment();
//		 comment.setId(2);
//		 comment.setCommentTime(new Date(2019,12,11));
//			list.add(comment);
//			 comment=new Comment();
//			 comment.setId(3);
//			 comment.setCommentTime(new Date(2000,12,11));
//				list.add(comment);
//		System.out.println(list);
//		Collections.sort(list, new Comparator<Comment>() {
//
//			@Override
//			public int compare(Comment o1, Comment o2) {
//				long d1=o1.getCommentTime().getTime();
//				long d2=o2.getCommentTime().getTime();
//				return d1>d2?-1:(d1==d2?0:1);
//			}
//		});
//		System.out.println(list);
	}

	/**
	 * 上传多个文件
	 * 
	 * @param files
	 * @throws Exception
	 */
	public static String uploadFile(MultipartFile[] files, String pic_path) throws Exception {
		StringBuilder pics = new StringBuilder();
		for (MultipartFile file : files) {
			pics.append(uploadFile(file, pic_path)).append(";");
		}
		return pics.toString();
	}
}
