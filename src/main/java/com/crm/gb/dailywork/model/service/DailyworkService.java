package com.crm.gb.dailywork.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.crm.gb.dailywork.model.vo.Dailywork;

@Service
public interface DailyworkService {
	
	public abstract int insertDailywork(Dailywork dailywork); //방문일지 등록 

	public abstract ArrayList<Dailywork> selectVisit(Dailywork dw); //영업일지_방문일지 선택

}
