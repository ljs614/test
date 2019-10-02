package triptaxi.review.model.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.getConnection;
import static triptaxi.common.template.JDBCTemplate.rollback;
import static triptaxi.common.template.JDBCTemplate.commit;

import java.sql.Connection;
import java.util.List;

import triptaxi.review.model.dao.ReviewDao;
import triptaxi.review.model.vo.Review;

public class ReviewService {
		
		private ReviewDao dao=new ReviewDao();
		
		public List<Review> selectReviewList(int cPage, int numPerPage){
			Connection conn=getConnection();
			List<Review> list=dao.selectReviewList(conn,cPage,numPerPage);
			close(conn);
			return list;
		}
		
		public int countReview() {
			Connection conn = getConnection();
			int result = dao.countReview(conn);
			close(conn);
			return result;
		}
		
		public int insertReviewWrite(Review r) {
			Connection conn=getConnection();
			int result=dao.insertReviewWrite(conn,r);
			if(result>0) {
				commit(conn);
			}else{
				rollback(conn);
			}
			close(conn);
			return result;
		}
		
		public Review reviewView(int reviewNo) {
			Connection conn=getConnection();
			Review r=dao.reviewView(conn,reviewNo);
			close(conn);
			return r;
		}
		
		public Review modifyReview(int reviewNo) {
			Connection conn=getConnection();
			Review r=dao.modifyReview(conn,reviewNo);
			close(conn);
			return r;
		}
}
