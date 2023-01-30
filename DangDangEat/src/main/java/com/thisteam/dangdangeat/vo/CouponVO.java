package com.thisteam.dangdangeat.vo;

/*
CREATE TABLE coupon(
	cp_code VARCHAR(30)  primary key, -- �����ڵ�(PK)
	cp_name VARCHAR(30), -- �����ڵ��
	cp_target VARCHAR(15), -- Ÿ��(birth, new_member, event )
	cp_discount_value INT, -- ������ / (����:%)
	cp_startdate VARCHAR(10), -- ����������(YYYY-MM-DD): birth, new_member�� null
	cp_period INT, -- �Ⱓ/ (����:��)
	cp_min_price INT, -- �ּ� ���ž�
	cp_max_discount INT, -- �ִ� ���ξ�
	cp_status INT -- ��������(0 ���� , 1 ����)
);
*/
public class CouponVO {
	private String cp_code;//�����ڵ�(PK)
	private String cp_name;//�����ڵ��
	private Cp_target cp_target;//-- Ÿ��(birth, new_member, event )
	private int cp_discount_value; //������(%)
	private String cp_startdate;//����������:  ����������(YYYY-MM-DD): birth, new_member�� null
	private int cp_period;//��ȿ�Ⱓ
	private int cp_min_price;//�ּұ��ž�
	private int cp_max_discount;//�ִ����αݾ�
	private int cp_status; //�����ڰ� (0 ���� , 1 ����)
	
	public String getCp_code() {
		return cp_code;
	}
	public void setCp_code(String cp_code) {
		this.cp_code = cp_code;
	}
	public String getCp_name() {
		return cp_name;
	}
	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}
	
	public Cp_target getCp_target() {
		return cp_target;
	}
	public void setCp_target(Cp_target cp_target) {
		this.cp_target = cp_target;
	}
	public int getCp_discount_value() {
		return cp_discount_value;
	}
	public void setCp_discount_value(int cp_discount_value) {
		this.cp_discount_value = cp_discount_value;
	}
	public String getCp_startdate() {
		return cp_startdate;
	}
	public void setCp_startdate(String cp_startdate) {
		this.cp_startdate = cp_startdate;
	}
	public int getCp_period() {
		return cp_period;
	}
	public void setCp_period(int cp_period) {
		this.cp_period = cp_period;
	}
	public int getCp_min_price() {
		return cp_min_price;
	}
	public void setCp_min_price(int cp_min_price) {
		this.cp_min_price = cp_min_price;
	}
	public int getCp_max_discount() {
		return cp_max_discount;
	}
	public void setCp_max_discount(int cp_max_discount) {
		this.cp_max_discount = cp_max_discount;
	}
	public int getCp_status() {
		return cp_status;
	}
	public void setCp_status(int cp_status) {
		this.cp_status = cp_status;
	}
	
	
	
	@Override
	public String toString() {
		return "CouponBean [cp_code=" + cp_code + ", cp_name=" + cp_name + ", cp_target=" + cp_target
				+ ", cp_discount_value=" + cp_discount_value + ", cp_startdate=" + cp_startdate + ", cp_period="
				+ cp_period + ", cp_min_price=" + cp_min_price + ", cp_max_discount=" + cp_max_discount + ", cp_status="
				+ cp_status + "]";
	}

	

	
	
}














