package com.github.asm0dey.lostodos.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import java.util.Date;

/**
 * Created by finkel on 14.03.15.
 */
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class Todo extends TaskHierarchyItem {
    private Date dueTime;
}
