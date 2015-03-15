package com.github.asm0dey.lostodos.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"owner_id", "name"}, name = "userTag"))
@DynamicInsert
@DynamicUpdate
public class Tag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String color;

    @ManyToOne(optional = false)
    @JsonBackReference("user_tags")
    private Person owner;

    @ManyToMany(cascade = CascadeType.ALL)
    @JsonBackReference("task_tags")
    private Set<TaskHierarchyItem> tasks;

}
