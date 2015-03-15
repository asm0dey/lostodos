package com.github.asm0dey.lostodos.endpoint;

import com.github.asm0dey.lostodos.entity.HumanUser;
import org.springframework.stereotype.Service;

import javax.validation.Valid;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

/**
 * Created by finkel on 15.03.15.
 */
@Service
@Path("/user")
public class HumanUserEndpoint {

    @POST
    public HumanUser createUser(@Valid HumanUser humanUser) {
        return null;
    }

    @GET
    @Produces("text/plain")
    public String hello() {
        return "Hi!";
    }
}
