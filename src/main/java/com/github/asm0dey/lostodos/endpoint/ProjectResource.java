package com.github.asm0dey.lostodos.endpoint;

import com.github.asm0dey.lostodos.entity.Project;
import com.github.asm0dey.lostodos.entity.QProject;
import com.github.asm0dey.lostodos.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by finkel on 21.03.15.
 */
@RequestMapping("api/project")
@RestController
public class ProjectResource {

    @Autowired
    private ProjectRepository projectRepository;

    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    Iterable<Project> getAll(){
        QProject project = QProject.project;
        return projectRepository.findAll(project.owner.login.eq(SecurityContextHolder.getContext().getAuthentication().getName()));
    }
}
