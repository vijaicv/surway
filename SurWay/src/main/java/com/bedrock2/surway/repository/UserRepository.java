package com.bedrock2.surway.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.bedrock2.surway.models.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	
}
