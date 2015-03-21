package com.github.asm0dey.lostodos.endpoint;

import com.github.asm0dey.lostodos.entity.TaskHierarchyItem;
import com.github.asm0dey.lostodos.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by finkel on 16.03.15.
 */
@Component
@PreAuthorize("hasRole('ROLE_REGISTERED')")
@Secured("ROLE_REGISTERED")
@RequestMapping("rest/task")
public class TaskEndpoint {
    @Autowired
    private TaskRepository taskRepository;

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    Iterable<TaskHierarchyItem> getAll() {
        return taskRepository.findAll();
    }
}
