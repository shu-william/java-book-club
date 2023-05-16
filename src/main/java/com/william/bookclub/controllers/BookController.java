package com.william.bookclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.william.bookclub.models.Book;
import com.william.bookclub.models.User;
import com.william.bookclub.services.BookService;
import com.william.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	UserService userServ;
	
	@Autowired
	BookService bookServ;
	
    @GetMapping("")
    public String home(Model model, HttpSession session) {
    	User user = userServ.checkLoggedIn(session);
    	if (user == null) {
    		return "redirect:/";
    	}
    	List<Book> books = bookServ.findAllObjects();
    	model.addAttribute("user", user);
    	model.addAttribute("books", books);
    	return "dashboard.jsp";
    }
    
    @GetMapping("/new")
    public String newBook(@ModelAttribute("book") Book book, Model model, HttpSession session) {
    	User user = userServ.checkLoggedIn(session);
    	if (user == null) {
    		return "redirect:/";
    	}
    	return "newbook.jsp";
    }
    
    @PostMapping("/create")
    public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
    	if (result.hasErrors()) {
    		return "newbook.jsp";
    	} else {
    		bookServ.createObject(book);
    		return "redirect:/books";
    	}
    }
    
    @GetMapping("/{bookId}")
    public String showBook(@PathVariable("bookId") Long bookId, Model model, HttpSession session) {
    	User user = userServ.checkLoggedIn(session);
    	if (user == null) {
    		return "redirect:/";
    	}
    	Book book = bookServ.findBook(bookId);
    	model.addAttribute("book", book);
    	return "showbook.jsp";
    }
    
    @GetMapping("/edit/{bookId}")
    public String editBook(@PathVariable("bookId") Long bookId, Model model, HttpSession session) {
    	User user = userServ.checkLoggedIn(session);
    	if (user == null) {
    		return "redirect:/";
    	}
    	Book book = bookServ.findBook(bookId);
    	model.addAttribute("book", book);
    	return "editbook.jsp";
    }
    
    @PutMapping("/edit/{id}")
    public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model) {
    	if (result.hasErrors()) {
    		model.addAttribute("book", book);
    		return "editbook.jsp";
    	} else {
    		bookServ.updateObject(book);
    		return "redirect:/books";
    	}
    }
    
    @GetMapping("/delete/{bookId}")
    public String deleteBook(@PathVariable("bookId") Long bookId) {
    	bookServ.deleteObject(bookId);
    	return "redirect:/books";
    }
    
}
