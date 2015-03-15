package com.github.asm0dey.lostodos.repository;

import com.github.asm0dey.lostodos.entity.Person;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by finkel on 15.03.15.
 */
public interface PersonRepository extends PagingAndSortingRepository<Person, Long>, QueryDslPredicateExecutor<Person> {
}
