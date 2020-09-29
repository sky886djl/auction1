package com.test;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.auction.entity.User;

public class TestUserDAO {
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
	 * 查询所有用户
	 * @return
	 */
	 
	public void findAllUsers(){
		List<User> all = sqlSession.selectList("findAllUsers");
		for(User u : all) {
			System.out.println(u);
		}
	}

	/**
	 * 通过用户名查找用户  -- 注册--用户名唯一
	 * @param username
	 * @return
	 */
	 
	public void findByUsername() {
		String username = "1563210";
		User u = sqlSession.selectOne("findByUsername",username);
		System.out.println(u);
	}
	
	/**
	 * 通过用户id查询用户
	 * @param id
	 * @return
	 */
	 
	public void getUserById() {
		User u = sqlSession.selectOne("getUserById",1);
		System.out.println(u);
	}
	
	/**
	 * 通过用户查找用户  --登录
	 * @param user
	 * @return
	 */
	 
	public void selectUser() {
		User user = new User();
		user.setUsername("1523628");
		user.setPassword("12345");
		User u = sqlSession.selectOne("selectUser",user);
		System.out.println(u);
	}

	/**
	 * 增加用户
	 * @param user
	 * @return
	 */
	 
	public void insert() {
		User user = new User();
		int u = sqlSession.insert("insert",user);
		System.out.println(u);
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	 
	public static void update() {
		User u = new User() ;
		u.setId(10);
		u.setName("LiMing");
		u.setGender("男");
		u.setTel("15863247000");
		u.setAge(20);
		u.setAddress("浙江省杭州市");
		u.setPassword("123321");
		int count = sqlSession.update("update",u);
		System.out.println(count);
	}
	 
	public static void selectEmail() {
		String email=sqlSession.selectOne("selectEmail", "111@qq.com");
		System.out.println(email);
	}
	
	/**
	 * 查询tel是否存在
	 * @param tel
	 * @return
	 */
	 
	public static void selectTel() {
		String tel=sqlSession.selectOne("selectTel", "15079080496");
		System.out.println(tel==null);
	}
	
	public static void main(String[] args) {
//		init();
//		selectEmail();
		//update();
//		Object selectOne = sqlSession.selectOne("getIdByUsername", "1523624");
//		System.out.println(selectOne);
//		testChangepwd();
//		destory();
		File folder = new File("C:\\Users\\Administrator\\Desktop\\auction\\WebContent\\statics\\images\\product");
		File[] files = folder.listFiles();
		for(File file:files){
			if(file.getName().equals("2.jpg")){
				file.delete();
				break;
			}
		}
	}
	
	public static void testChangepwd() {
		Map<String, Object> map = new HashMap<>();
		map.put("newpwd", "147852");
		map.put("id", 26);
		System.out.println(sqlSession.update("changePwd", map));
	}
	/**
	 * 删除用户信息
	 * @param id
	 * @return
	 */
	 
	public void delete() {
		System.out.println(sqlSession.delete("forbidden",11));
	}
	
	
	public void getMaxUsername() {
		String s=sqlSession.selectOne("getMaxUsername");
		System.out.println(s);
	}
	
	
	public void addAccount() {
		Map<String,Object> map = new HashMap<>();
		map.put("id", 19);
		map.put("money", 1000);
		System.out.println(sqlSession.update("addAccount",map));
	}
	
	
	public void subAccount() {
		Map<String,Object> map = new HashMap<>();
		map.put("id", 19);
		map.put("money", 200);
		System.out.println(sqlSession.update("subAccount",map));
	}
}
