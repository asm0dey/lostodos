package com.github.asm0dey.lostodos.repository;

import com.github.asm0dey.lostodos.entity.TodoGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

/**
 * Created by finkel on 15.03.15.
 */
public interface TodoGroupRepository extends QueryDslPredicateExecutor<TodoGroup>, JpaRepository<TodoGroup, Long> {
}
