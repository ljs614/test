package triptaxi.planner.model.dao;

import static triptaxi.common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import triptaxi.planner.model.vo.CityList;
import triptaxi.planner.model.vo.Planner;
import triptaxi.planner.model.vo.PlannerCity;
import triptaxi.planner.model.vo.PlannerDay;
import triptaxi.planner.model.vo.PlannerFullInfo;
import triptaxi.planner.model.vo.Tour;

public class PlannerDao {

	private Properties prop = new Properties();

	public PlannerDao() {
		String path = PlannerDao.class.getResource("/sql/planner/planner-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Planner selectPlanner(Connection conn, String plannerId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Planner p = null;
		String sql = prop.getProperty("selectPlanner");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				p = new Planner();
				p.setPlannerId(rs.getString("planner_id"));
				p.setPlannerName(rs.getString("planner_name"));
				p.setPlannerDate(rs.getDate("planner_date"));
				p.setPlannerWriter(rs.getString("planner_writer"));
				p.setPlannerTheme(rs.getString("planner_theme"));
				p.setPlannerLike(rs.getInt("planner_like"));
				p.setPlannerCount(rs.getInt("planner_count"));
				p.setPlannerPublic(rs.getString("planner_public").charAt(0));
				p.setPlannerWritedate(rs.getDate("planner_writedate"));
				p.setPlannerCoverimg(rs.getString("planner_coverimg"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return p;

	}

	public List<CityList> selectCityList(Connection conn, String continentName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCityList");
		List<CityList> list = new ArrayList<CityList>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, continentName);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CityList c = new CityList();
				c.setContinentName(rs.getString("continent_name"));
				c.setNationName(rs.getString("nation_name"));
				c.setCityName(rs.getString("city_name"));
				c.setLatitude(rs.getDouble("latitude"));
				c.setLongitude(rs.getDouble("longitude"));
				c.setFlagUrl(rs.getString("flag_url"));

				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	public int insertPlanner(Connection conn, String plannerName, String plannerDate, String plannerWriter, String imgUrl) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertPlanner");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, plannerName);
			pstmt.setString(2, plannerDate);
			pstmt.setString(3, plannerWriter);
			pstmt.setString(4, imgUrl);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public String selectPlannerId(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		String result = null;
		String sql = "select 'PL-'||seq_tt_planner.currval from dual";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return result;
	}

	public int insertPlannerDay(Connection conn, PlannerDay plannerday) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertPlannerDay");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, plannerday.getPlannerDayNo());
			pstmt.setString(2, plannerday.getCityName());
			pstmt.setString(3, plannerday.getPlannerId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public List<PlannerDay> selectPlannerDayList(Connection conn, String plannerId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PlannerDay> list = new ArrayList<PlannerDay>();
		String sql = prop.getProperty("selectPlannerDayList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PlannerDay pd = new PlannerDay();
				pd.setPlannerDayId(rs.getString("planner_day_id"));
				pd.setPlannerDayNo(rs.getInt("planner_day_no"));
				pd.setCityName(rs.getString("city_name"));
				pd.setTourList(rs.getString("tour_list"));
				pd.setPlannerId(rs.getString("planner_id"));
				list.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public Tour selectTour(Connection conn, String tourId, String table, String idName) {
		Statement stmt = null;
		Tour tour = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + table + " WHERE " + idName + "='" + tourId + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				tour = new Tour();
				tour.setTourId(rs.getString(1));
				tour.setTourName(rs.getString(2));
				tour.setTourEng(rs.getString(3));
				tour.setCity(rs.getString(4));
				tour.setTourLat(rs.getDouble(5));
				tour.setTourLng(rs.getDouble(6));
				tour.setImageUrl(rs.getString(7));
				tour.setClipCount(rs.getInt(9));
				tour.setReviewScore(rs.getInt(10));
				tour.setCategory(rs.getString(11));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return tour;
	}

	public List<Tour> selectTourList(Connection conn, String table, String col, String city) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + table + " WHERE " + col + "='" + city + "'";
		List<Tour> tourList = new ArrayList<Tour>();

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Tour tour = new Tour();
				tour.setTourId(rs.getString(1));
				tour.setTourName(rs.getString(2));
				tour.setTourEng(rs.getString(3));
				tour.setCity(rs.getString(4));
				tour.setTourLat(rs.getDouble(5));
				tour.setTourLng(rs.getDouble(6));
				tour.setImageUrl(rs.getString(7));
				tour.setClipCount(rs.getInt(9));
				tour.setReviewScore(rs.getInt(10));
				tour.setCategory(rs.getString(11));

				tourList.add(tour);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return tourList;
	}

	public List<Tour> selectFestivalList(Connection conn, String table, String col, String city, String col2,
			String month) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + table + " WHERE " + col + "='" + city + "' AND " + col2 + "= '" + month + "'";
		List<Tour> tourList = new ArrayList<Tour>();

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Tour tour = new Tour();
				tour.setTourId(rs.getString(1));
				tour.setTourName(rs.getString(2));
				tour.setTourEng(rs.getString(3));
				tour.setCity(rs.getString(4));
				tour.setTourLat(rs.getDouble(5));
				tour.setTourLng(rs.getDouble(6));
				tour.setImageUrl(rs.getString(7));
				tour.setClipCount(rs.getInt(9));
				tour.setReviewScore(rs.getInt(10));
				tour.setCategory(rs.getString(11));

				tourList.add(tour);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return tourList;
	}

	public int updateTitle(Connection conn, String plannerId, String title) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateTitle");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, plannerId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}
		return result;
	}

	public int updateCoverImg(Connection conn, String plannerId, String coverImg) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateCoverImg");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, coverImg);
			pstmt.setString(2, plannerId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}
		return result;

	}


	public List<Planner> selectPlannerList(Connection conn){ PreparedStatement
		pstmt=null; ResultSet rs=null; List<Planner> list=new ArrayList(); String
		sql=prop.getProperty("selectPlannerList"); try {
			pstmt=conn.prepareStatement(sql); rs=pstmt.executeQuery(); while(rs.next()) {
				Planner p=new Planner(); p.setPlannerId(rs.getString("planner_id"));
				p.setPlannerName(rs.getString("planner_name"));
				p.setPlannerDate(rs.getDate("planner_date"));
				p.setPlannerWriter(rs.getString("planner_writer"));
				p.setPlannerTheme(rs.getString("planner_theme"));
				p.setPlannerLike(rs.getInt("planner_like"));
				p.setPlannerCount(rs.getInt("planner_count"));
				p.setPlannerPublic(rs.getString("planner_public").charAt(0));
				p.setPlannerWritedate(rs.getDate("planner_writedate"));
				p.setPlannerCoverimg(rs.getString("planner_coverimg")); list.add(p); }
		}catch(SQLException e) { e.printStackTrace(); }finally { close(rs);
		close(pstmt); } return list; }


	public String selectCityImg(Connection conn, String cityName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCityImg");
		String result = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cityName);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updatStartDate(Connection conn, String plannerId, String date) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateStartDate");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, plannerId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deletePlannerDay(Connection conn, String plannerId, int dayNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deletePlannerDay");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			pstmt.setInt(2, dayNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updatePlannerDayNo(Connection conn, String plannerDayId, int dayNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updatePlannerDayNo");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dayNo);
			pstmt.setString(2, plannerDayId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public List<String> selectShareUser(Connection conn, String plannerId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectShareUser");
		List<String> userList = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				userList.add(rs.getString(1)+","+rs.getString(2)+","+rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return userList;
	}

	public String selectPlannerTourList(Connection conn, String plannerId, int dayNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectPlannerTourList");
		String tourList = "";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			pstmt.setInt(2, dayNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				tourList = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return tourList;
	}

	public int updateDayTourList(Connection conn, String tourList, String plannerId, int dayNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateDayTourList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tourList);
			pstmt.setString(2, plannerId);
			pstmt.setInt(3, dayNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int plannerCountUp(Connection conn, String plannerId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("plannerCountUp");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int refreshDay(Connection conn, String plannerId, int dayNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("refreshDay");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			pstmt.setInt(2, dayNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int plannerEnd(Connection conn, String plannerId, String plannerName, String plannerDate, String plannerTheme, char plannerPublic) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("plannerEnd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, plannerName);
			pstmt.setString(2, plannerDate);
			pstmt.setString(3, plannerTheme);
			pstmt.setString(4, plannerPublic+"");
			pstmt.setString(5, plannerId);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int plannerDayCount(Connection conn, String plannerId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("plannerDayCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int selectCountPlanner(Connection conn, String option) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) from ("+prop.getProperty("selectPlannerFullInfo")+" "+option+")";
	
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	
	public List<PlannerFullInfo> selectPlannerFullInfo(Connection conn, int cPage, int numPerPage, String option){
		Statement stmt = null;
		ResultSet rs = null;
		List<PlannerFullInfo> list = new ArrayList<PlannerFullInfo>();
		String sql = "select * from (select rownum as rnum, c.* from (" + prop.getProperty("selectPlannerFullInfo")+" "+option+")c) where rnum between "+ ((cPage-1)*numPerPage+1)+ " and "+ (cPage*numPerPage);
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				PlannerFullInfo pfi = new PlannerFullInfo();
				pfi.setPlannerId(rs.getString("planner_id"));
				pfi.setPlannerName(rs.getString("planner_name"));
				pfi.setPlannerDate(rs.getString("planner_date"));
				pfi.setPlannerWriter(rs.getString("planner_writer"));
				pfi.setPlannerTheme(rs.getString("planner_theme"));
				pfi.setPlannerLike(rs.getInt("planner_like"));
				pfi.setPlannerCount(rs.getInt("planner_count"));
				pfi.setPlannerPublic(rs.getString("planner_public").charAt(0));
				pfi.setPlannerWritedate(rs.getDate("planner_writedate"));
				pfi.setPlannerCoverimg(rs.getString("planner_coverimg"));
				pfi.setUserName(rs.getString("user_name"));
				pfi.setDayCount(rs.getInt("day_count"));
				
				list.add(pfi);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	
	public List<PlannerCity> selectPlannerCity(Connection conn, String idList){
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT PLANNER_ID, LISTAGG(CITY_NAME,',') WITHIN GROUP (ORDER BY ROWNUM DESC) FROM (SELECT PLANNER_ID,CITY_NAME FROM TT_PLANNER_DAY WHERE PLANNER_ID IN ('"+idList+"') GROUP BY PLANNER_ID, CITY_NAME ORDER BY PLANNER_ID) GROUP BY PLANNER_ID";
		List<PlannerCity> list = new ArrayList<PlannerCity>();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while(rs.next()) {
				PlannerCity pc = new PlannerCity();
				pc.setPlannerId(rs.getString(1));
				pc.setCityList(rs.getString(2));
				list.add(pc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	
	public List<PlannerCity> selectPlannerCity2(Connection conn, String option){
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT PLANNER_ID, LISTAGG(CITY_NAME,',') WITHIN GROUP (ORDER BY ROWNUM DESC) FROM (SELECT PLANNER_ID,CITY_NAME FROM TT_PLANNER_DAY "+option+" GROUP BY PLANNER_ID, CITY_NAME ORDER BY PLANNER_ID) GROUP BY PLANNER_ID";
		List<PlannerCity> list = new ArrayList();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				PlannerCity pc = new PlannerCity();
				pc.setPlannerId(rs.getString(1));
				pc.setCityList(rs.getString(2));
				list.add(pc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}


	public int updateThemeUp(Connection conn, String tourId, String plannerTheme) {
		Statement stmt=null;
		int result=0;
		String sql="UPDATE TT_THEME SET "+plannerTheme+"="+plannerTheme+"+1 WHERE TOUR_ID='"+tourId+"'";
		try {
			stmt=conn.createStatement();
			result=stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return result;
	}
	
	public int insertPlannerList(Connection conn, String plannerId, String userId, String email) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertPlannerList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			pstmt.setString(2, userId);
			pstmt.setString(3, email);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
