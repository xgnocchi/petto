package board;
import java.sql.Timestamp;
public class BoardDTO {
	private int post_id;			// 게시글 번호
	private int bo_view;			// 조회수
	private String bo_like;			// 추천여부
	private String title_head;		// 글머리
	private String bo_title;		// 글 제목
	private String bo_writer;		// 작성자
	private String bo_content;		// 글 내용
	private String bo_img;			// 이미지
	private Timestamp bo_reg;		// 작성일
	private Timestamp bo_update;	// 수정일
	private Timestamp bo_deldate;	// 삭제일
	private String bo_password;		// 비밀번호
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getBo_view() {
		return bo_view;
	}
	public void setBo_view(int bo_view) {
		this.bo_view = bo_view;
	}
	public String getBo_like() {
		return bo_like;
	}
	public void setBo_like(String bo_like) {
		this.bo_like = bo_like;
	}
	public String getTitle_head() {
		return title_head;
	}
	public void setTitle_head(String title_head) {
		this.title_head = title_head;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_writer() {
		return bo_writer;
	}
	public void setBo_writer(String bo_writer) {
		this.bo_writer = bo_writer;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public String getBo_img() {
		return bo_img;
	}
	public void setBo_img(String bo_img) {
		this.bo_img = bo_img;
	}
	public Timestamp getBo_reg() {
		return bo_reg;
	}
	public void setBo_reg(Timestamp bo_reg) {
		this.bo_reg = bo_reg;
	}
	public Timestamp getBo_update() {
		return bo_update;
	}
	public void setBo_update(Timestamp bo_update) {
		this.bo_update = bo_update;
	}
	public Timestamp getBo_deldate() {
		return bo_deldate;
	}
	public void setBo_deldate(Timestamp bo_deldate) {
		this.bo_deldate = bo_deldate;
	}
	public String getBo_password() {
		return bo_password;
	}
	public void setBo_password(String bo_password) {
		this.bo_password = bo_password;
	}
}
