package board;
import java.sql.Timestamp;

public class BoardDTO {
	private int post_id;		// 게시글번호
	private String category_id;	// 카테고리 id	
	private String title_head;	// 글머리
	private String bm_title;	// 글 제목
	private String bm_content;	// 글 내용
	private Timestamp reg_date;	// 작성 날짜
	private Timestamp up_date;	// 수정 날짜
	
}
