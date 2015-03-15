package com.github.asm0dey.lostodos.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.Set;

/**
 * Created by finkel on 15.03.15.
 */
@Entity
@Data
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
public class TodoGroup extends TaskHierarchyItem {
    @OneToMany(mappedBy = "parent")
    @JsonManagedReference("task_children")
    private Set<TaskHierarchyItem> children;

    @Column
    private boolean root = false;
}
