package com.william.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.william.bookclub.models.Book;
import com.william.bookclub.repositories.BookRepository;

@Service
public class BookService {

	@Autowired
	BookRepository bookRepo;
	
	public Book findBook(Long id) {
		Optional<Book> optionalObject = bookRepo.findById(id);
		if(optionalObject.isPresent()) {
			return optionalObject.get();
		} else {
			return null;
		}
	}
	
	public List<Book> findAllObjects() {
		return bookRepo.findAll();
	}
	
	public Book createObject(Book b) {
		return bookRepo.save(b);
	}
	
	public Book updateObject(Book b) {
		return bookRepo.save(b);
	}
	
	public void deleteObject(Long id) {
		bookRepo.deleteById(id);
	}
	
}
