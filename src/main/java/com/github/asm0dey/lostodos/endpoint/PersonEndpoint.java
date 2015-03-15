package com.github.asm0dey.lostodos.endpoint;

import com.github.asm0dey.lostodos.dao.PersonDao;
import com.github.asm0dey.lostodos.entity.Person;
import com.github.asm0dey.lostodos.entity.QTag;
import com.github.asm0dey.lostodos.entity.Tag;
import com.github.asm0dey.lostodos.repository.PersonRepository;
import com.github.asm0dey.lostodos.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.querydsl.QPageRequest;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import javax.websocket.server.PathParam;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.QueryParam;

/**
 * Created by finkel on 15.03.15.
 */
@RestController
@RequestMapping("/rest/user")
public class PersonEndpoint {


    @Autowired
    private TagRepository tagRepository;

    @Autowired
    private PersonRepository personRepository;

    @Autowired
    private PersonDao personDao;

    @RequestMapping(method = RequestMethod.POST, consumes = "application/json")
    public Person createUser(@Valid @RequestBody Person person) {
        return personRepository.save(person);
    }

    public Page<Tag> findTags(@PathParam("id") Long userId,
                              @QueryParam("page") @DefaultValue("0") Integer page,
                              @QueryParam("limit") @DefaultValue("10") Integer limit,
                              @QueryParam("term") String term) {
        QTag tag = QTag.tag;
        return tagRepository.findAll(tag.name.containsIgnoreCase(term), new QPageRequest(page, limit, tag.name.asc()));
    }
}
