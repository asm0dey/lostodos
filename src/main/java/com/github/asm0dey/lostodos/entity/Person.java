package com.github.asm0dey.lostodos.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.Email;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import static com.google.common.collect.Lists.newArrayList;

/**
 * Created by finkel on 14.03.15.
 */
@Entity
@EqualsAndHashCode
@ToString
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
public class Person implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    private Long id;

    @Column(nullable = false)
    @NotNull
    @Getter
    @Setter
    private String username;

    @Column(unique = true, nullable = false)
    @Email
    @NotNull
    @Getter
    @Setter
    private String email;


    @Column(nullable = false)
    @NotNull
    @JsonIgnore
    private String password;

    @OneToMany(mappedBy = "owner", cascade = CascadeType.ALL)
    @JsonManagedReference("user_tasks")
    @Getter
    @Setter
    private Set<TaskHierarchyItem> tasks;

    @OneToMany(mappedBy = "owner", cascade = CascadeType.ALL)
    @JsonManagedReference("user_tags")
    @Getter
    @Setter
    private Set<Tag> tags;

    @PrePersist
    void initTashkHierarchy() {
        password = BCrypt.hashpw(password, BCrypt.gensalt(13));
        tasks = new HashSet<>();
        TodoGroup root = new TodoGroup();
        root.setName("|root|");
        root.setRoot(true);
        root.setOwner(this);
        tasks.add(root);
    }

    @Override
    @JsonIgnore
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return newArrayList(new SimpleGrantedAuthority("USER"));
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    @JsonIgnore
    public boolean isEnabled() {
        return true;
    }

    @Override
    @JsonIgnore
    public String getPassword() {
        return password;
    }

    @JsonProperty
    public void setPassword(String password) {
        this.password = password;
    }
}
