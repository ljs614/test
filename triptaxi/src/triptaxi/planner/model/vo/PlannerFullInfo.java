package triptaxi.planner.model.vo;

import java.util.Date;

public class PlannerFullInfo {

	private String plannerId;
	private String plannerName;
	private String plannerDate;
	private String plannerWriter;
	private String plannerTheme;
	private int plannerLike;
	private int plannerCount;
	private char plannerPublic;
	private Date plannerWritedate;
	private String plannerCoverimg;
	private String userName;
	private int dayCount;
	private String cityList;
	
	public PlannerFullInfo() {
		// TODO Auto-generated constructor stub
	}

	public PlannerFullInfo(String plannerId, String plannerName, String plannerDate, String plannerWriter,
			String plannerTheme, int plannerLike, int plannerCount, char plannerPublic, Date plannerWritedate,
			String plannerCoverimg, String userName, int dayCount, String cityList) {
		super();
		this.plannerId = plannerId;
		this.plannerName = plannerName;
		this.plannerDate = plannerDate;
		this.plannerWriter = plannerWriter;
		this.plannerTheme = plannerTheme;
		this.plannerLike = plannerLike;
		this.plannerCount = plannerCount;
		this.plannerPublic = plannerPublic;
		this.plannerWritedate = plannerWritedate;
		this.plannerCoverimg = plannerCoverimg;
		this.userName = userName;
		this.dayCount = dayCount;
		this.cityList = cityList;
	}

	public String getPlannerId() {
		return plannerId;
	}

	public void setPlannerId(String plannerId) {
		this.plannerId = plannerId;
	}

	public String getPlannerName() {
		return plannerName;
	}

	public void setPlannerName(String plannerName) {
		this.plannerName = plannerName;
	}

	public String getPlannerDate() {
		return plannerDate;
	}

	public void setPlannerDate(String plannerDate) {
		this.plannerDate = plannerDate;
	}

	public String getPlannerWriter() {
		return plannerWriter;
	}

	public void setPlannerWriter(String plannerWriter) {
		this.plannerWriter = plannerWriter;
	}

	public String getPlannerTheme() {
		return plannerTheme;
	}

	public void setPlannerTheme(String plannerTheme) {
		this.plannerTheme = plannerTheme;
	}

	public int getPlannerLike() {
		return plannerLike;
	}

	public void setPlannerLike(int plannerLike) {
		this.plannerLike = plannerLike;
	}

	public int getPlannerCount() {
		return plannerCount;
	}

	public void setPlannerCount(int plannerCount) {
		this.plannerCount = plannerCount;
	}

	public char getPlannerPublic() {
		return plannerPublic;
	}

	public void setPlannerPublic(char plannerPublic) {
		this.plannerPublic = plannerPublic;
	}

	public Date getPlannerWritedate() {
		return plannerWritedate;
	}

	public void setPlannerWritedate(Date plannerWritedate) {
		this.plannerWritedate = plannerWritedate;
	}

	public String getPlannerCoverimg() {
		return plannerCoverimg;
	}

	public void setPlannerCoverimg(String plannerCoverimg) {
		this.plannerCoverimg = plannerCoverimg;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getDayCount() {
		return dayCount;
	}

	public void setDayCount(int dayCount) {
		this.dayCount = dayCount;
	}

	public String getCityList() {
		return cityList;
	}

	public void setCityList(String cityList) {
		this.cityList = cityList;
	}

	@Override
	public String toString() {
		return "PlannerFullInfo [plannerId=" + plannerId + ", plannerName=" + plannerName + ", plannerDate="
				+ plannerDate + ", plannerWriter=" + plannerWriter + ", plannerTheme=" + plannerTheme + ", plannerLike="
				+ plannerLike + ", plannerCount=" + plannerCount + ", plannerPublic=" + plannerPublic
				+ ", plannerWritedate=" + plannerWritedate + ", plannerCoverimg=" + plannerCoverimg + ", userName="
				+ userName + ", dayCount=" + dayCount + ", cityList=" + cityList + "]";
	}

	
	
}
