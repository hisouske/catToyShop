package dto;


public class pagenum {
	private int page;  // 현재 기준 페이지
	private int count;  // 총 글수
	private int start;  // 페이지그룹 시작 번호
	private int end;    // 페이지그룹 끝 번호
	private int nowPageStart;  //표시될 페이지 시작번호
	private int nowPageEnd;    //표시될 페이지 끝번호
	private int prev;
	private int next;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		if (page < 1) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setCount(Integer count) {
		if (count < 1) {
			return;
		}
		this.count = count;

		calcPage();
	}

	public int getCount() {
		return count;
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

	public int getPrev() {
		return prev;
	}

	public int getNext() {
		return next;
	}

	public int getNowPageStart() {
		return nowPageStart;
	}

	public int getNowPageEnd() {
		return nowPageEnd;
	}

	private void calcPage() {
		int tempEnd = (int) (Math.ceil(page / 8.0) * 8.0);

//		System.out.println("this.count =" + this.count);
		
		this.start = tempEnd - 7;
		if (tempEnd * 10 > this.count) { 
			this.end = (int) Math.ceil(this.count / 8.0);
		} else {
			this.end = tempEnd; 
			
		}
		
		nowPageStart = (page-1)*8+1;
		nowPageEnd = nowPageStart + 7;
		if(nowPageEnd > this.count) {
			nowPageEnd=this.count;
		}
		
//		System.out.println("page = " + page);
//		System.out.println("start = " + start);
//		System.out.println("this.end = " + this.end);
//		System.out.println("nowpageStart= " + this.nowPageStart);
//		System.out.println("nowpageEnd= " + this.nowPageEnd);
		//this.prev = this.start != 1;
	//	this.next = this.end * 10 < this.count;
	}
}
