package com.service;

import java.util.List;

import com.pojo.Baoxiaobill;

public interface BaoxiaoService {

	public List<Baoxiaobill> findBaoxiaoBillListByUser(int userid);
	
	public void saveBaoxiao(Baoxiaobill baoxiaoBill);
	
	public Baoxiaobill findBaoxiaoBillById(Integer id);
	
	public void deleteBaoxiaoBillById(int id);

	public List<Baoxiaobill> findLeaveBillListByUser(Integer id);
}
