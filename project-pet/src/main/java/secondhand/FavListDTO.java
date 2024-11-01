package secondhand;

import java.sql.Timestamp;

public class FavListDTO {
	private int favNum;
	private int itemNum;
	private int idx;
	private String name;
	private int price;
	private Timestamp favDate;
	
	public void setFavNum(int favNum) {
		this.favNum = favNum;
	}
	public int getFavNum() {
		return favNum;
	}
	
	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}
	public int getItemNum() {
		return itemNum;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getIdx() {
		return idx;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPrice() {
		return price;
	}
	
	public void setFavDate(Timestamp favDate) {
		this.favDate = favDate;
	}
	public Timestamp getFavDate() {
		return favDate;
	}
}
