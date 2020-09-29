package com.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import com.auction.entity.Admin;

public class TestAdminDAO {
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
    

	/**
	 * 登录
	 * @param admin
	 * @return
	 */
	public static void login() {
		Admin admin=new Admin("admin","123456");
		Admin a=sqlSession.selectOne("selectAdminByAdmin",admin);
		System.out.println(a);
	}
	
    
    /**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	public static void add() {
		Admin aa=new Admin("linda","123");
		aa.setAuthority(1);
		
	}
	
	/**
	 * 按删除与否来查询管理员列表
	 * @param d =null 为启用和禁用数据   d!=null为删除状态的数据
	 * @return
	 */
	 
	public static void list(Integer d){
		
	}
    
	/**
	 * 禁用
	 * @return
	 */
    
	public static void forbid(int id) {
		
	}
	
	/**
	 * 启用
	 * @return
	 */
	public static void activate(int id) {
		
	}
	
	/**
	 * 假删除管理员
	 * @param id
	 * @return
	 */
	public static void deleteFalse(int id) {
		
	}
	
	/**
	 * 真删除管理员
	 * @param id
	 * @return
	 */
	public static void deleteTrue(int id) {
		
	}
	
	/**
	 * 假批量删除
	 * @param ids
	 * @return
	 */
	public static void deleteAllFalse(List<Integer> ids) {
		
	}
	
	
	/**
	 * 真批量删除
	 * @param ids
	 * @return
	 */
	public static void deleteAllTrue(List<Integer> ids) {
		
	}
	
	public static void main(String[] args) {
		init();
		login();
		destory();
	}
	

}
