package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.BaoxiaobillMapper;
import com.pojo.Baoxiaobill;
import com.pojo.BaoxiaobillExample;
import com.service.BaoxiaoService;

@Service
public class BaoxiaoServcieImpl implements BaoxiaoService {
	
	@Autowired
	private BaoxiaobillMapper baoxiaoBillMapper;

	@Override
	public List<Baoxiaobill> findBaoxiaoBillListByUser(int userid) {
		BaoxiaobillExample example = new BaoxiaobillExample();
		BaoxiaobillExample.Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userid);
		return baoxiaoBillMapper.selectByExample(example);
	}

	@Override
	public void saveBaoxiao(Baoxiaobill baoxiaoBill){
		//获取请假单ID
		Integer id = baoxiaoBill.getId();
		/**新增保存*/
		if(id==null){
			//1：从Session中获取当前用户对象，将LeaveBill对象中user与Session中获取的用户对象进行关联
			//leaveBill.setUser(SessionContext.get());//建立管理关系
			//2：保存请假单表，添加一条数据
			baoxiaoBillMapper.insert(baoxiaoBill);
		}
		/**更新保存*/
		else{
			//1：执行update的操作，完成更新
			baoxiaoBillMapper.updateByPrimaryKey(baoxiaoBill);
		}

	}

	@Override
	public Baoxiaobill findBaoxiaoBillById(Integer id) {
		Baoxiaobill bill = baoxiaoBillMapper.selectByPrimaryKey(id);
		return bill;
	}

	@Override
	public void deleteBaoxiaoBillById(int id) {
		baoxiaoBillMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Baoxiaobill> findLeaveBillListByUser(Integer id) {
		BaoxiaobillExample example = new BaoxiaobillExample();
		BaoxiaobillExample.Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(id);
		return baoxiaoBillMapper.selectByExample(example);
	}

}
