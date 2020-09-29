package com.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.auction.entity.Comment;
import com.auction.entity.Type;
import com.auction.entity.User;

public class TestTypeDAO {
	private static SqlSessionFactory sqlSessionFactory;
    private static SqlSession sqlSession;

    public static void init() {
        String resource="mybatis-config.xml";
        InputStream inputStream;
        try {
            inputStream=Resources.getResourceAsStream(resource);
            sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
            sqlSession=sqlSessionFactory.openSession();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public static void destory() {
        sqlSession.commit();
        sqlSession.close();
    }
    
    public static void getAllTypes() {
    	List<Object> selectList = sqlSession.selectList("getAllTypes");
    	System.out.println(selectList);
    }
    
    public static void add() {
    	Type obj = new Type();
    	obj.setTypeName("xxx");
    	obj.setSpecification("ccccc");
    	System.out.println(sqlSession.insert("com.auction.dao.TypeDAO.add",obj));
    	
    	obj = new Type();
    	obj.setTypeName("ced");
    	obj.setSpecification("csss");
    	System.out.println(sqlSession.insert("com.auction.dao.TypeDAO.add",obj));
    }
    
    public static void getByName() {
    	Object selectList = sqlSession.selectOne("getTypeByName","电子产品");
    	System.out.println(selectList);
    }
    
    public static void delete() {
    	System.out.println(sqlSession.delete("com.auction.dao.TypeDAO.delete",10));
    }
    public static void deleteAll() {
    	sqlSession.delete("com.auction.dao.TypeDAO.deleteAll",new int[] {11,12,13});
    }
    
    public static void update() {
    	Type obj = sqlSession.selectOne("getTypeByName","电子产品");
    	System.out.println(obj);
    	obj.setTypeName(obj.getTypeName()+"00");
    	obj.setSpecification(obj.getTypeName()+"22");
    	sqlSession.update("com.auction.dao.TypeDAO.update",obj);
    }
    
    public static void testaddComment() {
    	Comment comment=new Comment();
    	comment.setContent("价格竟然这么高了！");
    	comment.setOriginalPost_id(null);
    	comment.setUser_id(new User(26));
    	comment.setPro_id(21);
    	sqlSession.insert("addComment",comment);
    }
    
    public static void getCommentsByProId() {
    	List<Comment>list=sqlSession.selectList("getCommentsByProId",21);
    	List<Comment> origin=new ArrayList<>();
    	for(Comment c:list) {
    		if(c.getOriginalPost_id()==null) {
    			origin.add(c);
    			System.out.println("origin.size:"+origin.size());
    			//list.remove(c);
    		} else {
    			System.out.println(c.getOriginalPost_id()+":"+origin.size());
    			for(Comment o:origin) {
    				System.out.println(c.getOriginalPost_id()+'-'+o.getId());
    				if(c.getOriginalPost_id()==o.getId()) {
    					o.getReplys().add(c);
    					break;
    				}
    			}
    		}
    	}
    	for(Comment c:origin) {
    		System.out.println(c.getReplys());
    	}
//    	for(Comment c:list) {
//    		System.out.println(c);
//    	}
    }
    
    public static void testComment() {
    	List<Comment> list = sqlSession.selectList("getCommentsByUserId",26);
		for(Comment c:list) {
			c.setProduct(sqlSession.selectOne("getProductById", c.getPro_id()));
		}
		for(Comment c:list) {
			System.out.println(c);
		}
    }
    
    public static void main(String[] args) {
    	init();
//    	getAllTypes();
//    	getByName();
////    	add();
//    	Object selectOne = sqlSession.selectOne("getTypeById",1);
//    	System.out.println(selectOne);
//    	testaddComment();
    	testComment();
//    	delete();
//    	update();
//    	deleteAll();
    	destory();
	}
}
