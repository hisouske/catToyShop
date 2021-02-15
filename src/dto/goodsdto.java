package dto;

public class goodsdto {
	int code;

	String category;
	String name;
	int quantity;
	String pic;
	String dpic;
	String dtext;
	public String getDpic() {
		return dpic;
	}

	public String getDtext() {
		return dtext;
	}

	public void setDtext(String dtext) {
		this.dtext = dtext;
	}

	public void setDpic(String dpic) {
		this.dpic = dpic;
	}

	int price;

	public int getCode() {
		return code;
	}
	
	public void setCode(int code) {
		this.code = code;
	}
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}
