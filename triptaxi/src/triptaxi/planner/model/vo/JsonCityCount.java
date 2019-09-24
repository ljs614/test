package triptaxi.planner.model.vo;

public class JsonCityCount {

	private String city;
	private int count;
	
	public JsonCityCount() {
		// TODO Auto-generated constructor stub
	}

	public JsonCityCount(String city, int count) {
		super();
		this.city = city;
		this.count = count;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "JsonCityCount [city=" + city + ", count=" + count + "]";
	}
	
	
}
