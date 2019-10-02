package triptaxi.review.model.vo;

import java.util.Date;

public class Review {
	private int reviewNo;
	private String reviewCategory;
	private String reviewTitle;
	private String reviewContent;
	private String reviewWriter;
	private String reviewFilePathOriginal;
	private String reviewFilePathRename;
	private Date reviewDate;
	private int reviewReadCount;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNo, String reviewCategory, String reviewTitle, String reviewContent, String reviewWriter,
			String reviewFilePathOriginal, String reviewFilePathRename, Date reviewDate, int reviewReadCount) {
		super();
		this.reviewNo = reviewNo;
		this.reviewCategory = reviewCategory;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewWriter = reviewWriter;
		this.reviewFilePathOriginal = reviewFilePathOriginal;
		this.reviewFilePathRename = reviewFilePathRename;
		this.reviewDate = reviewDate;
		this.reviewReadCount = reviewReadCount;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewCategory() {
		return reviewCategory;
	}

	public void setReviewCategory(String reviewCategory) {
		this.reviewCategory = reviewCategory;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewFilePathOriginal() {
		return reviewFilePathOriginal;
	}

	public void setReviewFilePathOriginal(String reviewFilePathOriginal) {
		this.reviewFilePathOriginal = reviewFilePathOriginal;
	}

	public String getReviewFilePathRename() {
		return reviewFilePathRename;
	}

	public void setReviewFilePathRename(String reviewFilePathRename) {
		this.reviewFilePathRename = reviewFilePathRename;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewReadCount() {
		return reviewReadCount;
	}

	public void setReviewReadCount(int reviewReadCount) {
		this.reviewReadCount = reviewReadCount;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewCategory=" + reviewCategory + ", reviewTitle=" + reviewTitle
				+ ", reviewContent=" + reviewContent + ", reviewWriter=" + reviewWriter + ", reviewFilePathOriginal="
				+ reviewFilePathOriginal + ", reviewFilePathRename=" + reviewFilePathRename + ", reviewDate="
				+ reviewDate + ", reviewReadCount=" + reviewReadCount + "]";
	}
	
	
	

}
