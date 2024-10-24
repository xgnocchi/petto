package board;

public class CategoryDTO {
	private int category_id;	// 카테고리 id
	private int category;		// 카테고리 분류
	private int category_tag;	// 말머리
	
	public void setCategory_id(int category_id)		{ this.category_id = category_id; }
	public int getCategory_id()						{ return category_id; }
	public void setCategory(int category)			{ this.category = category; }
	public int getCategory()						{ return category; }
	public void setCategory_tag(int category_tag)	{ this.category_tag = category_tag; }
	public int getCategory_tag()					{ return category_tag; }
}
