package com.fw.s1.product;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fw.s1.product.ProductMapper;
import com.fw.s1.product.ProductVO;
@SpringBootTest
class ProductMapperTest {
	
	@Autowired
	private ProductMapper productMapper;

//	@Test
	void getListTest() throws Exception {
		List<ProductVO> list = productMapper.getList();
		System.out.println(list.size());
		assertNotNull(list);
	}
	
	@Test
	void setInsertTest() throws Exception{
		int total=0;
		for(int i=0;i<10;i++) {
			ProductVO vo = new ProductVO();
			vo.setProductTitle("productTitle"+i);
			vo.setProductPrice((long) (i*10000));
			vo.setProductContents("productContents"+i);
			vo.setCollab("collab"+i);
			vo.setProductType("productType"+i);
			int result = productMapper.setInsert(vo);
			total += result;
			System.out.println("r : "+result+" t : "+total);
		}
		assertNotEquals(0, total);
	}
	
	
	void setUpdateTest() throws Exception {
		ProductVO vo = new ProductVO();
		vo.setProductTitle("productTitle");
		vo.setCollab("collab");
		vo.setProductType("productType");
	}
}
