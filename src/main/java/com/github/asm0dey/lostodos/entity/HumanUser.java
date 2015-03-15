package com.github.asm0dey.lostodos.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by finkel on 14.03.15.
 */
@Entity
@Data
@NoArgsConstructor
public class HumanUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String username;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    @OneToMany(mappedBy = "owner")
    private Set<TaskHierarchyItem> tasks;

    @OneToMany(mappedBy = "owner")
    private Set<Tag> tags;

    @PrePersist
    void initTashkHierarchy() {
        tasks = new HashSet<>();
        TodoGroup root = new TodoGroup();
        root.setName("|root|");
        root.setRoot(true);
    }

}
