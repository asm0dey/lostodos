package com.github.asm0dey.lostodos.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by finkel on 14.03.15.
 */
@Entity
@Data
@NoArgsConstructor
public abstract class TaskHierarchyItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @ManyToOne
    private TodoGroup parent;

    @ManyToOne(optional = false)
    private HumanUser owner;

    @ManyToMany(mappedBy = "tasks")
    private Set<Tag> tags;

}
