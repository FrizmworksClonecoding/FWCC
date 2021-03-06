package com.fw.s1.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;

import com.fw.s1.member.MemberVO;
import com.google.gson.Gson;

@RestController
@RequestMapping("/address/**")
public class AddressController {

	@Autowired
	private AddressService addressService;
	
	@GetMapping("getSelectOne")
	public String getSelectOne(AddressVO addressVO, Authentication authentication)throws Exception{
		addressVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		
		addressVO = addressService.getSelectOne(addressVO);
		
		if(addressVO==null) {
			return "";
		}
		addressVO.phoneSeperator();
		Gson gson = new Gson();
		
		addressService.recentUseUpdate(addressVO);
		
		return gson.toJson(addressVO);
	}
	
	@GetMapping("deleteSelect")
	@Transactional(rollbackFor = Exception.class)
	public String deleteAddress(long[] addrNums, Authentication authentication)throws Exception{
		List<AddressVO> addressVOs = new ArrayList<>();
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		
		for(long addrNum : addrNums) {
			AddressVO addressVO = new AddressVO();
			addressVO.setAddrNum(addrNum);
			addressVO.setUsername(memberVO.getUsername());
			addressVOs.add(addressVO);
		}
		if(addressService.deleteSelect(addressVOs)==0) {
			throw new Exception();
		}
		
		AddressVO addressVO = new AddressVO();
		addressVO.setUsername(memberVO.getUsername());
		
		if(addressService.recentDeleteUpdate(addressVO) == 0) {
			throw new Exception();
		}
		
		Gson gson = new Gson();
		addressVO = addressService.getSelectRecent(addressVO);
		if(addressVO != null) {
			addressVO.phoneSeperator();
			return gson.toJson(addressVO);
		}
		
		return "";
	}
	
	@GetMapping("getAddressList")
	public String[] getAddressList(Authentication authentication)throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		List<AddressVO> list = addressService.getAddressList(memberVO);
		int length = list.size();
		
		if(length==0) {
			String[] def = {""};
			return def;
		}
		
		String[] results = new String[length-1];
		
		int temp = 0;
		Gson gson = new Gson();
		for(int i = 0 ; i < length; i++) {
			AddressVO addressVO = list.get(i);
			if(addressVO.getOrderAddr()) {
				addressVO.concatAddress();
				results[temp+i] = gson.toJson(addressVO);
			}else {
				temp=-1;
			}
		}
		
		return results;
	}
	
	@GetMapping("updateAddress")
	@Transactional(rollbackFor = Exception.class)
	public Long updateAddress(AddressVO addressVO, Authentication authentication)throws Exception{
		addressVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		Long result = addressService.beforeAddreess(addressVO);
		
		if(result<1) {
			return result;
		}
		
		result = addressService.updateAddress(addressVO);
		return result;
	}
	
	@GetMapping("setAddress")
	@Transactional(rollbackFor = Exception.class)
	public Long setAddress(AddressVO addressVO, Authentication authentication)throws Exception{
		addressVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		addressService.beforeAddreess(addressVO);
		
		return addressService.setAddress(addressVO);
	}
	
	@GetMapping("getSelectRecent")
	public String getSelectRecent(Authentication authentication)throws Exception{
		AddressVO addressVO = new AddressVO();
		addressVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		
		Gson gson = new Gson();
		addressVO = addressService.getSelectRecent(addressVO);
		
		if(addressVO==null) {
			return "";
		}
		addressVO.phoneSeperator();
		
		return gson.toJson(addressVO);
	}
	
	@GetMapping("checkCount")
	public Long checkCount(Authentication authentication)throws Exception{
		AddressVO addressVO = new AddressVO();
		addressVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		return addressService.checkCount(addressVO);
	}

}
