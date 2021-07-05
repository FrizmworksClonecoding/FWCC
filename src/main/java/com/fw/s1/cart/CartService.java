package com.fw.s1.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fw.s1.member.MemberVO;

@Service
public class CartService {

	@Autowired
	private CartMapper cartMapper;
	
	public List<CartVO> getCartList(MemberVO memberVO)throws Exception{
		return cartMapper.getCartList(memberVO);
	}
	
	public List<CartVO> getCartSelectList(List<CartVO> list)throws Exception{
		return cartMapper.getCartSelectList(list);
	}
	
	public Long getCartCount(MemberVO memberVO)throws Exception{
		return cartMapper.getCartCount(memberVO);
	}
	
	public Long getStock(CartVO cartVO)throws Exception{
		return cartMapper.getStock(cartVO);
	}
	
	public Long setCartList(List<CartVO> list)throws Exception{
		return cartMapper.setCartList(list);
	}
	
	public Long updateCount(CartVO cartVO)throws Exception{
		return cartMapper.updateCount(cartVO);
	}
	
	public Long updateCountList(List<CartVO> list)throws Exception{
		return cartMapper.updateCountList(list);
	}
	
	public Long deleteItem(List<CartVO> list)throws Exception{
		return cartMapper.deleteItem(list);
	}
	
	public Long deleteCart(MemberVO memberVO)throws Exception{
		return cartMapper.deleteCart(memberVO);
	}
}
