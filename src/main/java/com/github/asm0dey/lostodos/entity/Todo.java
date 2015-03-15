package com.github.asm0dey.lostodos.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import java.util.Date;

/**
 * Created by finkel on 14.03.15.
 */
@Entity
@Data
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
@DynamicInsert
@DynamicUpdate
public class Todo extends TaskHierarchyItem {
    private Date dueTime;
}
