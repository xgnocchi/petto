package secondhand;

import java.sql.Timestamp;


public class ItemInfoDTO {
	private int itemNum;		// 상품 번호
	private int idx;			// 회원 번호
	private int itemId;			// 상품 분류
	private int animId;			// 동물 분류
	private int isSelling;		// 판매 상태
	private int condition;		// 물품 상태
	private String name;		// 상품명
	private int price;			// 가격
	private String nick;		// 판매자
	private String content;		// 상세 내용
	private String img;			// 첨부 사진
	private int viewCount;		// 조회수
	private Timestamp reg;		// 등록일
	private Timestamp reReg;	// 재등록일
	
	public void setItemNum (int itemNum) {
		this.itemNum = itemNum;
	}
	public int getItemNum () {
		return itemNum;
	}
	
	public void setIdx (int idx) {
		this.idx = idx;
	}
	public int getIdx () {
		return idx;
	}
	
	public void setItemId (int itemId) {
		this.itemId = itemId;
	}
	public int getItemId () {
		return itemId;
	}
	
	public void setAnimId (int animId) {
		this.animId = animId;
	}
	public int getAnimId () {
		return animId;
	}
	
	public void setIsSelling(int isSelling) {
		this.isSelling = isSelling;
	}
	public int getIsSelling() {
		return isSelling;
	}
	
	public void setCondition(int condition) {
		this.condition = condition;
	}
	public int getCondition() {
		return condition;
	}

	public void setName (String name) {
		this.name = name;
	}
	public String getName () {
		return name;
	}

	public void setPrice (int price) {
		this.price = price;
	}
	public int getPrice () {
		return price;
	}

	public void setNick (String nick) {
		this.nick = nick;
	}
	public String getNick () {
		return nick;
	}

	public void setContent (String content) {
		this.content = content;
	}
	public String getContent () {
		return content;
	}

	public void setImg (String img) {
		this.img = img;
	}
	public String getImg () {
		return img;
	}
	
	public void setViewCount (int viewCount) {
		this.viewCount = viewCount;
	}
	public int getViewCount () {
		return viewCount;
	}
	
	public void setReg (Timestamp reg) {
		this.reg = reg;
	}
	public Timestamp getReg () {
		return reg;
	}
	
	public void setReReg (Timestamp reReg) {
		this.reReg = reReg;
	}
	public Timestamp getReReg () {
		return reReg;
	}
}
