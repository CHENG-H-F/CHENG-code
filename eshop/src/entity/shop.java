package entity;

public class shop {
    private String shop_name;
    private String shop_province;
    private String shop_city;
    private String shop_title;
    private String shop_address;
    private String shop_tel;
    private String shop_time;
    public shop() {
    	super();
    }
	public shop(String shop_name, String shop_province, String shop_city, String shop_title, String shop_address,
			String shop_tel, String shop_time) {
		super();
		this.shop_name = shop_name;
		this.shop_province = shop_province;
		this.shop_city = shop_city;
		this.shop_title = shop_title;
		this.shop_address = shop_address;
		this.shop_tel = shop_tel;
		this.shop_time = shop_time;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getShop_province() {
		return shop_province;
	}
	public void setShop_province(String shop_province) {
		this.shop_province = shop_province;
	}
	public String getShop_city() {
		return shop_city;
	}
	public void setShop_city(String shop_city) {
		this.shop_city = shop_city;
	}
	public String getShop_title() {
		return shop_title;
	}
	public void setShop_title(String shop_title) {
		this.shop_title = shop_title;
	}
	public String getshop_address() {
		return shop_address;
	}
	public void setshop_address(String shop_address) {
		this.shop_address = shop_address;
	}
	public String getShop_tel() {
		return shop_tel;
	}
	public void setShop_tel(String shop_tel) {
		this.shop_tel = shop_tel;
	}
	public String getShop_time() {
		return shop_time;
	}
	public void setShop_time(String shop_time) {
		this.shop_time = shop_time;
	}
}
