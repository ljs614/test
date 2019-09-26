package com.triptaxi.attraction.model.vo;

import java.sql.Date;

public class TourReview {

		private int tourReviewNo;
		private String tourReviewWriter;
		private String tourReviewContent;
		private String tourId;
		private int tourReviewScore;
		private Date tourReviewDate;
		
		public TourReview() {
			// TODO Auto-generated constructor stub
		}

		public TourReview(int tourReviewNo, String tourReviewWriter, String tourReviewContent, String tourId,
				int tourReviewScore, Date tourReviewDate) {
			super();
			this.tourReviewNo = tourReviewNo;
			this.tourReviewWriter = tourReviewWriter;
			this.tourReviewContent = tourReviewContent;
			this.tourId = tourId;
			this.tourReviewScore = tourReviewScore;
			this.tourReviewDate = tourReviewDate;
		}

		public int getTourReviewNo() {
			return tourReviewNo;
		}

		public void setTourReviewNo(int tourReviewNo) {
			this.tourReviewNo = tourReviewNo;
		}

		public String getTourReviewWriter() {
			return tourReviewWriter;
		}

		public void setTourReviewWriter(String tourReviewWriter) {
			this.tourReviewWriter = tourReviewWriter;
		}

		public String getTourReviewContent() {
			return tourReviewContent;
		}

		public void setTourReviewContent(String tourReviewContent) {
			this.tourReviewContent = tourReviewContent;
		}

		public String getTourId() {
			return tourId;
		}

		public void setTourId(String tourId) {
			this.tourId = tourId;
		}

		public int getTourReviewScore() {
			return tourReviewScore;
		}

		public void setTourReviewScore(int tourReviewScore) {
			this.tourReviewScore = tourReviewScore;
		}

		public Date getTourReviewDate() {
			return tourReviewDate;
		}

		public void setTourReviewDate(Date tourReviewDate) {
			this.tourReviewDate = tourReviewDate;
		}

		@Override
		public String toString() {
			return "TourReview [tourReviewNo=" + tourReviewNo + ", tourReviewWriter=" + tourReviewWriter
					+ ", tourReviewContent=" + tourReviewContent + ", tourId=" + tourId + ", tourReviewScore="
					+ tourReviewScore + ", tourReviewDate=" + tourReviewDate + "]";
		}

		
}
