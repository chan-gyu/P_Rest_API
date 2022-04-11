package com.cg.P_Rest_API.book.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cg.P_Rest_API.book.vo.Book;

@RestController
public class BookController {

	private List<Book> bookList = new ArrayList<>();
	
	@RequestMapping(method = RequestMethod.GET, path="/books")
	public List<Book> GetAll(){
		/*
		 * if(bookList.size()>0) { for(int i=0;bookList.size()>=0;i++) {
		 * System.out.println(bookList.get(i)); } }
		 */
		return bookList;
	}
	
	@RequestMapping(method = RequestMethod.POST, path="/add")
	public String Add(@RequestBody Book book) {
		bookList.add(book);
		return "Add";
	}
	
	@RequestMapping(method = RequestMethod.PUT, path="/update/{id}")
	public String Update(@RequestBody Book tobook, @PathVariable int id) {
		
		Book find_book = bookList.stream().filter(book -> book.getId() == id).findAny().orElse(null);
		
		if(find_book != null) {
			find_book.setAuthor(tobook.getAuthor());
			find_book.setName(tobook.getName());
			find_book.setPrice(tobook.getPrice());
			
			return "success";
		}
		return "not vaild";
	}
	
	@RequestMapping(method = RequestMethod.DELETE, path="/delete/{id}/{name}")
	public String Delete(@PathVariable int id, @PathVariable String name) {
		
		Book find_book = bookList.stream().filter(book -> book.getId()==id&&book.getName().equals(name)).findAny().orElse(null);
		if(find_book != null) {
			bookList.remove(find_book);
			return "success";
		}
		return "not valid";
	}
	
	
	
}
