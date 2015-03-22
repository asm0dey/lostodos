package com.github.asm0dey.lostodos.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * A user.
 */
@Entity
@Table(name = "T_USER")
@Data
@NoArgsConstructor
public class User extends AbstractAuditingEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Pattern(regexp = "^[a-z0-9]*$")
    @Size(min = 1, max = 50)
    @Column(length = 50, unique = false, nullable = false)
    private String login;

    @JsonIgnore
    @NotNull
    @Size(min = 5, max = 100)
    @Column(length = 100)
    private String password;

    @Email
    @Size(max = 100)
    @Column(length = 100, unique = true)
    private String email;

    @JsonIgnore
    @ManyToMany
    @JoinTable(
            name = "T_USER_AUTHORITY",
            joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "authority_name", referencedColumnName = "name")})
    private Set<Authority> authorities = new HashSet<>();

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "user")
    private Set<PersistentToken> persistentTokens = new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL,orphanRemoval = true, mappedBy = "owner")
    @JsonManagedReference("user_projects")
    private Set<Project> projects;

    @OneToMany(cascade = CascadeType.ALL,orphanRemoval = true, mappedBy = "owner")
    private Set<Tag> tags;

    @PrePersist
    void initProjects() {
        projects = new HashSet<>();
        projects.add(Project.builder().name("Default").owner(this).build());
    }

    }
