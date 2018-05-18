package com.crm.gb.dailywork.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.dailywork.model.dao.DailyworkDao;
import com.crm.gb.dailywork.model.vo.Dailywork;

@Service("dailyworkService")
public class DailyworkServiceImpl implements DailyworkService{
	
	@Autowired
	private DailyworkDao dailyworkDao;
	
	@Override
	public int insertDailywork(Dailywork dailywork) {
		return dailyworkDao.insertDailywork(dailywork);
	}

}
