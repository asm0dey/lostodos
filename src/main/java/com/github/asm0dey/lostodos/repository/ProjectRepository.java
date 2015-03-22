package com.github.asm0dey.lostodos.repository;

import com.github.asm0dey.lostodos.entity.Project;
import com.github.asm0dey.lostodos.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import java.util.List;

/**
 * Spring Data JPA repository for the PersistentToken entity.
 */
public interface ProjectRepository extends JpaRepository<Project, Long>, QueryDslPredicateExecutor<Project> {}
