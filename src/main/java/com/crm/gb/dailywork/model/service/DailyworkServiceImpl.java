package com.crm.gb.dailywork.model.service;


import java.util.ArrayList;

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

	@Override
	public ArrayList<Dailywork> selectVisit(Dailywork dw) {
		//영업일지 _ 방문일지선택
		return dailyworkDao.selectVisit(dw);
	}
	
	/** 방문내역 리스트 */
	@Override
	public ArrayList<Dailywork> selectDailyHistory(int client_no) {
		return dailyworkDao.selectDailyHistory(client_no);
	}

}
