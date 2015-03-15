package com.github.asm0dey.lostodos.repository;

import com.github.asm0dey.lostodos.entity.HumanUser;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by finkel on 15.03.15.
 */
@Repository
public interface HumanUserRepository extends PagingAndSortingRepository<HumanUser, Long>, QueryDslPredicateExecutor<HumanUser> {
}
