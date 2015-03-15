package com.github.asm0dey.lostodos.endpoint;

import org.glassfish.jersey.server.ResourceConfig;
import org.springframework.stereotype.Component;

import javax.ws.rs.ApplicationPath;

@Component
@ApplicationPath("/rest")
public class JerseyConfig extends ResourceConfig {

    public JerseyConfig() {
        register(HumanUserEndpoint.class);
    }

}
