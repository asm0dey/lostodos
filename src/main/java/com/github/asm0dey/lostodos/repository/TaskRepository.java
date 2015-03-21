package com.github.asm0dey.lostodos.repository;

import com.github.asm0dey.lostodos.entity.TaskHierarchyItem;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.access.prepost.PreFilter;

/**
 * Created by finkel on 15.03.15.
 */
public interface TaskRepository extends PagingAndSortingRepository<TaskHierarchyItem, Long>, QueryDslPredicateExecutor<TaskHierarchyItem> {
    @Override
    @PreAuthorize("hasRole('ROLE_REGISTERED')")
    @PreFilter("filterObject.owner.email == authentication.name")
    Iterable<TaskHierarchyItem> findAll();
}
