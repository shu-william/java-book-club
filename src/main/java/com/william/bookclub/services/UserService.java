package com.william.bookclub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.william.bookclub.models.User;
import com.william.bookclub.repositories.UserRepository;
import com.william.bookclub.validators.LoginUser;

import jakarta.servlet.http.HttpSession;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
    public User createUser(User u) {
    	return userRepo.save(u);
    }
    
    public User updateUser(User u) {
    	return userRepo.save(u);
    }
    
    public void deleteUser(Long id) {
    	userRepo.deleteById(id);
    }
    
    public User findById(Long id) {
    	Optional<User> optionalUser = userRepo.findById(id);
    	if (optionalUser.isPresent()) {
    		return optionalUser.get();
    	} else {
    		return null;
    	}
    }
    
    public User register(User newUser, BindingResult result) {        
        // Reject if email is taken (present in database)
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
    	if (potentialUser.isPresent()) {
    		result.rejectValue("email", "Exists", "The specified email is already in use.");
    	}    	
        // Reject if password doesn't match confirmation
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    	    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
        // Return null if result has errors
    	if(result.hasErrors()) {
    	    return null;
    	}
        // Hash and set password, save user to database
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return this.createUser(newUser);
    }
    
    public User login(LoginUser newLoginObject, BindingResult result) {
    	// Find user in the DB by email
        // Reject if NOT present
    	Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
    	if (!potentialUser.isPresent()) {
    		result.rejectValue("email", "Exists", "The email provided does not exist in our database.");
    		return null;
    	}
    	// Get the user if it exists
    	User user = potentialUser.get();
        // Reject if BCrypt password match fails
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}    
        // Return null if result has errors
    	if(result.hasErrors()) {
    	    return null;
    	}    	
        // Otherwise, return the user object
        return user;
    }
    
    public User checkLoggedIn(HttpSession session) {
    	Long id = (Long) session.getAttribute("id");
    	if (id == null) {
    		return null;
    	}
    	return this.findById(id);
    }
    
}