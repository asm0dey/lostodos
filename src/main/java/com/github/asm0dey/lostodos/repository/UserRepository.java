package com.github.asm0dey.lostodos.repository;

import com.github.asm0dey.lostodos.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import java.util.Optional;

/**
 * Spring Data JPA repository for the User entity.
 */
public interface UserRepository extends JpaRepository<User, Long>, QueryDslPredicateExecutor<User> {

    Optional<User> findOneByEmail(String email);

    void delete(User t);

    Optional<User> findOneByLogin(String login);
}
