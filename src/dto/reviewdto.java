package dto;

public class reviewdto {
	int code;
	int admincode;
	String id;
	String text;
	int point;
	int gcode;

	public int getAdmincode() {
		return admincode;
	}

	public void setAdmincode(int admincode) {
		this.admincode = admincode;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getGcode() {
		return gcode;
	}

	public void setGcode(int gcode) {
		this.gcode = gcode;
	}

}
