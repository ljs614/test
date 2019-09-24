package triptaxi.planner.model.vo;

public class PlannerDay {

	String plannerDayId;
	int plannerDayNo;
	String cityName;
	String tourList;
	String plannerId;
	
	public PlannerDay() {
		// TODO Auto-generated constructor stub
	}

	public PlannerDay(String plannerDayId, int plannerDayNo, String cityName, String tourList, String plannerId) {
		super();
		this.plannerDayId = plannerDayId;
		this.plannerDayNo = plannerDayNo;
		this.cityName = cityName;
		this.tourList = tourList;
		this.plannerId = plannerId;
	}

	public String getPlannerDayId() {
		return plannerDayId;
	}

	public void setPlannerDayId(String plannerDayId) {
		this.plannerDayId = plannerDayId;
	}

	public int getPlannerDayNo() {
		return plannerDayNo;
	}

	public void setPlannerDayNo(int plannerDayNo) {
		this.plannerDayNo = plannerDayNo;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getTourList() {
		return tourList;
	}

	public void setTourList(String tourList) {
		this.tourList = tourList;
	}

	public String getPlannerId() {
		return plannerId;
	}

	public void setPlannerId(String plannerId) {
		this.plannerId = plannerId;
	}

	@Override
	public String toString() {
		return "PlannerDay [plannerDayId=" + plannerDayId + ", plannerDayNo=" + plannerDayNo + ", cityName=" + cityName
				+ ", tourList=" + tourList + ", plannerId=" + plannerId + "]";
	}

	
	
	
}
