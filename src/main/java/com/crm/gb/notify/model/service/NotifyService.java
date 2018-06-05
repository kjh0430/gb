package com.crm.gb.notify.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.notify.model.vo.Notify;

@Service
public interface NotifyService {

	int insertNotify(Notify notify);
	ArrayList<Notify> selectNotify(Emp emp);
	int updateNotify(Notify notify);

}
