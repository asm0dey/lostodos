package com.github.asm0dey.lostodos.repository;

import com.github.asm0dey.lostodos.entity.PersistentToken;
import com.github.asm0dey.lostodos.entity.User;
import org.joda.time.LocalDate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import java.util.List;

/**
 * Spring Data JPA repository for the PersistentToken entity.
 */
public interface PersistentTokenRepository extends JpaRepository<PersistentToken, String>, QueryDslPredicateExecutor<PersistentToken> {

    List<PersistentToken> findByUser(User user);

    List<PersistentToken> findByTokenDateBefore(LocalDate localDate);

}
