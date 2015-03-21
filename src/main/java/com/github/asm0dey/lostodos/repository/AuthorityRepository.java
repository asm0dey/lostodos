package com.github.asm0dey.lostodos.repository;


import com.github.asm0dey.lostodos.entity.Authority;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Spring Data JPA repository for the Authority entity.
 */
public interface AuthorityRepository extends JpaRepository<Authority, String> {
}
