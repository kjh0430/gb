package com.crm.gb.notify.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.notify.model.dao.NotifyDao;
import com.crm.gb.notify.model.vo.Notify;

@Service("NotifyService")
public class NotifyServiceImpl implements NotifyService{

	@Autowired
	NotifyDao notifyDao;
		
	@Override
	public int insertNotify(Notify notify) {
		return notifyDao.insertNotify(notify);
	}

	@Override
	public ArrayList<Notify> selectNotify(Emp emp) {
		return notifyDao.selectNotify(emp);
	}

	@Override
	public int updateNotify(Notify notify) {
		return notifyDao.updateNotify(notify);
	}
	
}
