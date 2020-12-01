package entity;

public class goods {
    private String goods_id;
    private String goods_classify;
    private String goods_title;
    private float goods_price;
    private String goods_photo;
    public goods() {
    	super();
    }
	public goods(String goods_id, String goods_classify, String goods_title, float goods_price, String goods_photo) {
		super();
		this.goods_id = goods_id;
		this.goods_classify = goods_classify;
		this.goods_title = goods_title;
		this.goods_price = goods_price;
		this.goods_photo = goods_photo;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_classify() {
		return goods_classify;
	}
	public void setGoods_classify(String goods_classify) {
		this.goods_classify = goods_classify;
	}
	public String getGoods_title() {
		return goods_title;
	}
	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}
	public float getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(float goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_photo() {
		return goods_photo;
	}
	public void setGoods_photo(String goods_photo) {
		this.goods_photo = goods_photo;
	}
    
}
