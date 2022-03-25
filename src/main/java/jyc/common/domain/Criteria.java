package jyc.common.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum; 	// now page number
	private int amount; 	// number of board per page
	
	// For search
	private String type; 	// search type
	private String keyword; // search content
	
	public Criteria() {
		this(1, 5); // this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// For search
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
}
