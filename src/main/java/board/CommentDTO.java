package board;
import java.sql.Timestamp;
public class CommentDTO {
	private Timestamp com_reg;	// 작성 시간
	private String com_content;	// 댓글 내용
	private String com_img;		// 이미지
	private String com_update;	// 댓글 수정
	private String com_delete;	// 댓글 삭제
	private int ref;			// 글 그룹
	private int re_step;		// 스텝
	private int re_level;		// 레벨
	private int num;			// 글번호
	
	public Timestamp getCom_reg() {
		return com_reg;
	}
	public void setCom_reg(Timestamp com_reg) {
		this.com_reg = com_reg;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public String getCom_img() {
		return com_img;
	}
	public void setCom_img(String com_img) {
		this.com_img = com_img;
	}
	public String getCom_update() {
		return com_update;
	}
	public void setCom_update(String com_update) {
		this.com_update = com_update;
	}
	public String getCom_delete() {
		return com_delete;
	}
	public void setCom_delete(String com_delete) {
		this.com_delete = com_delete;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
