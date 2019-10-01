package triptaxi.planner.model.vo;

public class PlannerCity {

	private String plannerId;
	private String cityList;
	
	public PlannerCity() {
		// TODO Auto-generated constructor stub
	}

	public PlannerCity(String plannerId, String cityList) {
		super();
		this.plannerId = plannerId;
		this.cityList = cityList;
	}

	public String getPlannerId() {
		return plannerId;
	}

	public void setPlannerId(String plannerId) {
		this.plannerId = plannerId;
	}

	public String getCityList() {
		return cityList;
	}

	public void setCityList(String cityList) {
		this.cityList = cityList;
	}

	@Override
	public String toString() {
		return "PlannerCity [plannerId=" + plannerId + ", cityList=" + cityList + "]";
	}
	
}
