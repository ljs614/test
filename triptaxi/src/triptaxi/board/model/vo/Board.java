package triptaxi.board.model.vo;

import java.util.Date;

public class Board {

		int qnaNo;
		String qnaCategory;
		String qnaTitle;
		String qnaContent;
		String qnaWriter;
		Date qnaDate;
		int qnaReadCount;
		public Board() {
			
		}
		public Board(int qnaNo, String qnaCategory, String qnaTitle, String qnaContent, String qnaWriter, Date qnaDate,
				int qnaReadCount) {
			super();
			this.qnaNo = qnaNo;
			this.qnaCategory = qnaCategory;
			this.qnaTitle = qnaTitle;
			this.qnaContent = qnaContent;
			this.qnaWriter = qnaWriter;
			this.qnaDate = qnaDate;
			this.qnaReadCount = qnaReadCount;
		}
		public int getQnaNo() {
			return qnaNo;
		}
		public void setQnaNo(int qnaNo) {
			this.qnaNo = qnaNo;
		}
		public String getQnaCategory() {
			return qnaCategory;
		}
		public void setQnaCategory(String qnaCategory) {
			this.qnaCategory = qnaCategory;
		}
		public String getQnaTitle() {
			return qnaTitle;
		}
		public void setQnaTitle(String qnaTitle) {
			this.qnaTitle = qnaTitle;
		}
		public String getQnaContent() {
			return qnaContent;
		}
		public void setQnaContent(String qnaContent) {
			this.qnaContent = qnaContent;
		}
		public String getQnaWriter() {
			return qnaWriter;
		}
		public void setQnaWriter(String qnaWriter) {
			this.qnaWriter = qnaWriter;
		}
		public Date getQnaDate() {
			return qnaDate;
		}
		public void setQnaDate(Date qnaDate) {
			this.qnaDate = qnaDate;
		}
		public int getQnaReadCount() {
			return qnaReadCount;
		}
		public void setQnaReadCount(int qnaReadCount) {
			this.qnaReadCount = qnaReadCount;
		}
		@Override
		public String toString() {
			return "Board [qnaNo=" + qnaNo + ", qnaCategory=" + qnaCategory + ", qnaTitle=" + qnaTitle + ", qnaContent="
					+ qnaContent + ", qnaWriter=" + qnaWriter + ", qnaDate=" + qnaDate + ", qnaReadCount="
					+ qnaReadCount + "]";
		}
		
		
	
}
