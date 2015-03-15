package com.github.asm0dey.lostodos.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by finkel on 14.03.15.
 */
@Entity
@Data
@NoArgsConstructor
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"owner_id", "name"}, name = "userTag"))
public class Tag implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String color;

    @ManyToOne(optional = false)
    private HumanUser owner;

    @ManyToMany
    private Set<TaskHierarchyItem> tasks;

}
