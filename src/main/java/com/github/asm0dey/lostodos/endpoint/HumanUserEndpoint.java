package com.github.asm0dey.lostodos.endpoint;

import com.github.asm0dey.lostodos.entity.Person;
import com.github.asm0dey.lostodos.entity.QTag;
import com.github.asm0dey.lostodos.entity.Tag;
import com.github.asm0dey.lostodos.repository.HumanUserRepository;
import com.github.asm0dey.lostodos.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.querydsl.QPageRequest;
import org.springframework.stereotype.Component;

import javax.validation.Valid;
import javax.websocket.server.PathParam;
import javax.ws.rs.*;

/**
 * Created by finkel on 15.03.15.
 */
@Component
@Path("/user")
public class HumanUserEndpoint {

    @Autowired
    private HumanUserRepository userRepository;
    @Autowired
    private TagRepository tagRepository;

    @POST
    public Person createUser(@Valid Person person) {
        return userRepository.save(person);
    }

    @GET
    @Produces("text/plain")
    public String hello() {
        return "Hi!";
    }

    @GET
    @Path("{id}/tag")
    public Page<Tag> findTags(@PathParam("id") Long userId,
                              @QueryParam("page") @DefaultValue("0") Integer page,
                              @QueryParam("limit") @DefaultValue("10") Integer limit,
                              @QueryParam("term") String term) {
        QTag tag = QTag.tag;
        return tagRepository.findAll(tag.name.containsIgnoreCase(term), new QPageRequest(page, limit, tag.name.asc()));
    }
}
