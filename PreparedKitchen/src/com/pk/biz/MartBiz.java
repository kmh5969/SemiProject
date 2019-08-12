package com.pk.biz;

import java.util.List;

import com.pk.dao.MartDao;
import com.pk.dto.InterestListDto;
import com.pk.dto.MartDto;

public class MartBiz {
	
	MartDao dao = new MartDao();
	
	public List<InterestListDto> selectList() {
		
		return dao.selectList();
	}
	
	public int createDummy(List<MartDto> list) {
		
		return dao.createDummy(list);
	}

}