package com.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.auction.entity.Article;

public class TestArticleDAO {
	
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
	 * 获取所有文章
	 * @return
	 */
	public static void getAllAricles(){
		List<Article> selectList = sqlSession.selectList("getAllAricles");
		for (Article article : selectList) {
			System.out.println(article);
		}
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public static void getOneById() {
		System.out.println((sqlSession.selectOne("getAricleById",2)).toString());
	}
	
	/**
	 * 修改一条记录
	 * @param article
	 * @return
	 */
	public static void update(){
		Article selectOne = sqlSession.selectOne("getAricleById",1);
		selectOne.setContent(selectOne.getContent()+"111");
		selectOne.setTitle(selectOne.getTitle()+"111");
		selectOne.setCategory(2);
		int i=sqlSession.update("updateAricle",selectOne);
		System.out.println(i);
	}
	
	/**
	 * 根据id删除
	 * @param id
	 * @return
	 */
	public static void deleteById() {
		System.out.println(sqlSession.delete("deleteAricleById",3));
	}
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public static void deleteByIds() {
		System.out.println(sqlSession.delete("deleteAriclesByIds",new int[] {4,5,6}));
	}
	
	public static void increment() {
		sqlSession.update("browseTimesIncrement",2);
	}
	
	/**
	 * 增加一条数据
	 * @param article
	 * @return
	 */
	public static void add() {
		Article article = new Article();
//		#{title},#{category},#{content},#{pro_id},now(),#{admin_id},#{status}
		article.setTitle("恭喜15236用户成功拍卖宝马车");
		article.setCategory(1);
		article.setContent("恭喜15236用户成功拍卖宝马车,本次拍卖成交价15w元人民币，创造历史新高！");
		article.setStatus(1);
		sqlSession.insert("addAricle",article);
		
	}
	
	public static void main(String[] args) {
		init();
//		getAllAricles();
//		getOneById();
		update();
//		deleteById();
//		deleteByIds();
//		getAllAricles();
//		increment();
		destory();
	}
}
