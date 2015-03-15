package com.github.asm0dey.lostodos.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

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
@EqualsAndHashCode(callSuper = true)
public class TodoGroup extends TaskHierarchyItem {
    @OneToMany(mappedBy = "parent")
    private Set<TaskHierarchyItem> children;

    @Column
    private boolean root = false;
}
