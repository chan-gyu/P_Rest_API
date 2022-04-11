package com.cg.P_Rest_API.book.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Book {
	
	private int id;
	private String name;
	private String author;
	private int price;

}
