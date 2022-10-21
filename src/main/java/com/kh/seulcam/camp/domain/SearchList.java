package com.kh.seulcam.camp.domain;

public class SearchList {
	private int page;
	private String city;
	private String category;
	private String search;
	private String regist;
	
	public SearchList() {}
	
	
	public SearchList(int page, String city, String category, String search, String regist) {
		super();
		this.page = page;
		this.city = city;
		this.category = category;
		this.search = search;
		this.regist = regist;
	}
	@Override
	public String toString() {
		return "SearchList [page=" + page + ", city=" + city + ", category=" + category + ", search=" + search
				+ ", regist=" + regist + "]";
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getRegist() {
		return regist;
	}
	public void setRegist(String regist) {
		this.regist = regist;
	}
	
	
}
