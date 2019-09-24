package triptaxi.attraction.dao;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static triptaxi.common.template.JDBCTemplate.close;
import com.triptaxi.attraction.model.vo.Attraction;
public class AttractionDao {
	private Properties prop=new Properties();
	public AttractionDao() {
		String path=AttractionDao.class.getResource("/sql/attraction/attraction-query.properties").getPath();
		
		try {
			prop.load(new FileReader(path));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public Attraction selectAttraction(Connection conn,String attId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectAttraction");
		Attraction a=new Attraction();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, attId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
				a.setAttractionId(rs.getString("attraction_id"));
				a.setAttractionName(rs.getString("attraction_name"));
				a.setAttractionEng(rs.getString("attraction_eng"));
				a.setCity(rs.getString("city"));
				a.setAttractionLat(rs.getDouble("attraction_lat"));
				a.setAttractionLng(rs.getDouble("attraction_lng"));
				a.setImageUrl(rs.getString("image_url"));
				a.setAttractionComment(rs.getString("attraction_comment"));
				a.setClipCount(rs.getInt("clip_count"));
				a.setReviewScore(rs.getInt("reviewscore"));
				a.setCategory(rs.getString("category"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return a;
	}
	
	
}
