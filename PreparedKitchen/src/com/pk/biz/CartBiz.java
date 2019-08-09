package com.pk.biz;

import java.util.List;

import com.pk.dao.CartDao;
import com.pk.dto.CartDto;

public class CartBiz {

	private CartDao dao = new CartDao();
	
	public List<CartDto> selectList(String id) {
		return dao.selectList(id);
	}
	public List<CartDto> selectListRecipe(String id) {
		return dao.selectListRecipe(id);
	}
}
