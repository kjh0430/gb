package com.crm.gb.dailywork.model.service;

import org.springframework.stereotype.Service;

import com.crm.gb.dailywork.model.vo.Dailywork;

@Service
public interface DailyworkService {
	
	public abstract int insertDailywork(Dailywork dailywork); //방문일지 등록 
}
