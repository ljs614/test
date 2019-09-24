package triptaxi.planner.model.vo;

import java.sql.Date;

public class Planner {
	
	private String plannerId;
	private String plannerName;
	private String plannerWriter;
	private Date plannerDate;
	private String plannerPlan;
	
	public Planner() {
		// TODO Auto-generated constructor stub
	}

	public Planner(String plannerId, String plannerName, String plannerWriter, Date plannerDate, String plannerPlan) {
		super();
		this.plannerId = plannerId;
		this.plannerName = plannerName;
		this.plannerWriter = plannerWriter;
		this.plannerDate = plannerDate;
		this.plannerPlan = plannerPlan;
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

	public String getPlannerWriter() {
		return plannerWriter;
	}

	public void setPlannerWriter(String plannerWriter) {
		this.plannerWriter = plannerWriter;
	}

	public Date getPlannerDate() {
		return plannerDate;
	}

	public void setPlannerDate(Date plannerDate) {
		this.plannerDate = plannerDate;
	}

	public String getPlannerPlan() {
		return plannerPlan;
	}

	public void setPlannerPlan(String plannerPlan) {
		this.plannerPlan = plannerPlan;
	}

	

}
