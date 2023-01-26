package com.thisteam.dangdangeat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.dangdangeat.mapper.CouponMapper;
import com.thisteam.dangdangeat.vo.CouponVO;

@Service
public class OrderService {
	

//	@Autowired
//	private OrderMapper mapper; �ΰ� ����?
	@Autowired
	CouponMapper cp_mapper;
	
	//���� ���
	public int insertCoupon(CouponVO coupon) {
		return cp_mapper.insertCoupon(coupon);
	}
	
	//���� ����
	public int updateCoupon(CouponVO coupon) {
		return cp_mapper.updateCoupon(coupon);
	}
	
	//���� ����
	public int deleteCoupon(CouponVO coupon) {
		return cp_mapper.deleteCoupon(coupon);
	}
	
	// ������������ ���� ���� ��ȸ
	public int getCouponTotalAmount() {
		return cp_mapper.selectCouponCount();
	}
	
	
	
	

}















