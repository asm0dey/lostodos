package com.github.asm0dey.lostodos.endpoint;

import com.github.asm0dey.lostodos.entity.HumanUser;
import com.github.asm0dey.lostodos.repository.HumanUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.validation.Valid;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

/**
 * Created by finkel on 15.03.15.
 */
@Component
@Path("/user")
public class HumanUserEndpoint {

    @Autowired
    private HumanUserRepository userRepository;

    @POST
    public HumanUser createUser(@Valid HumanUser humanUser) {
        return userRepository.save(humanUser);
    }

    @GET
    @Produces("text/plain")
    public String hello() {
        return "Hi!";
    }
}
