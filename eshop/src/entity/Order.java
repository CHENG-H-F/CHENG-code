package entity;

import org.joda.time.*;

public class Order {
    private String order_id;
    private String order_goods;
    private float order_price;
    private String order_time;
    private String order_username;
    
	public Order(String order_id, String order_goods, float order_price, String order_time, String order_username) {
		super();
		this.order_id = order_id;
		this.order_goods = order_goods;
		this.order_price = order_price;
		this.order_time = order_time;
		this.order_username = order_username;
	}
	public String getOrder_username() {
		return order_username;
	}
	public void setOrder_username(String order_username) {
		this.order_username = order_username;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrder_goods() {
		return order_goods;
	}
	public void setOrder_goods(String order_goods) {
		this.order_goods = order_goods;
	}
	public float getOrder_price() {
		return order_price;
	}
	public void setOrder_price(float order_price) {
		this.order_price = order_price;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	} 
    
    
}

