package triptaxi.planner.model.vo;

import java.util.Date;

public class Planner {
	
	private String plannerId;
	private String plannerName;
	private Date plannerDate;
	private String plannerWriter;
	private String plannerTheme;
	private int plannerLike;
	private int plannerCount;
	private int plannerPublic;
	private Date plannerWritedate;
	private String plannerCoverimg;
	
	
	public Planner() {
		// TODO Auto-generated constructor stub
	}


	public Planner(String plannerId, String plannerName, Date plannerDate, String plannerWriter, String plannerTheme,
			int plannerLike, int plannerCount, int plannerPublic, Date plannerWritedate, String plannerCoverimg) {
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


	public Date getPlannerDate() {
		return plannerDate;
	}


	public void setPlannerDate(Date plannerDate) {
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


	public int getPlannerPublic() {
		return plannerPublic;
	}


	public void setPlannerPublic(int plannerPublic) {
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


	@Override
	public String toString() {
		return "Planner [plannerId=" + plannerId + ", plannerName=" + plannerName + ", plannerDate=" + plannerDate
				+ ", plannerWriter=" + plannerWriter + ", plannerTheme=" + plannerTheme + ", plannerLike=" + plannerLike
				+ ", plannerCount=" + plannerCount + ", plannerPublic=" + plannerPublic + ", plannerWritedate="
				+ plannerWritedate + ", plannerCoverimg=" + plannerCoverimg + "]";
	}
	
	
}
