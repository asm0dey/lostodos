package com.github.asm0dey.lostodos.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.*;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by finkel on 21.03.15.
 */
@Entity
@Table(name = "project")
@Data
@EqualsAndHashCode(exclude = "owner")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Project extends AbstractAuditingEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JsonBackReference("user_projects")
    private User owner;

    private String name;

    @OneToMany(mappedBy = "project")
    private Set<TaskHierarchyItem> tasks;


}
