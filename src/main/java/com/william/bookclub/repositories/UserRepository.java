package com.william.bookclub.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.william.bookclub.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	
    Optional<User> findByEmail(String email);
    List<User> findAll();
    
}
