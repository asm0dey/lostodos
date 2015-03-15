package com.github.asm0dey.lostodos.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by finkel on 14.03.15.
 */
@Entity
@Data
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
public abstract class TaskHierarchyItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @ManyToOne
    @JsonBackReference("task_children")
    private TodoGroup parent;

    @ManyToOne(optional = false)
    @JsonBackReference("user_tasks")
    private Person owner;

    @ManyToMany(mappedBy = "tasks", cascade = CascadeType.ALL)
    @JsonManagedReference("task_tags")
    private Set<Tag> tags;

}
