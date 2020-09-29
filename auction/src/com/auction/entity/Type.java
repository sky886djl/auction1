package com.auction.entity;

public class Type {
	private int id;
	private String typeName;
	private String specification;
	private int count;//该分类下的产品数
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Type(int id){
		this.id=id;
	}
	public Type() {
	}
	
	@Override
	public String toString() {
		return "Type [id=" + id + ", name=" + typeName + ", specification=" + specification + "]";
	}
	
	
	
	
}
