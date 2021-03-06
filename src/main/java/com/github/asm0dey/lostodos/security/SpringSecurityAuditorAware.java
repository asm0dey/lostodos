package com.github.asm0dey.lostodos.security;

import com.github.asm0dey.lostodos.conf.Constants;
import org.springframework.data.domain.AuditorAware;
import org.springframework.stereotype.Component;

/**
 * Implementation of AuditorAware based on Spring Security.
 */
@Component("springSecurityAuditorAware")
public class SpringSecurityAuditorAware implements AuditorAware<String> {

    public String getCurrentAuditor() {
        String userName = SecurityUtils.getCurrentLogin();
        return (userName == null || userName.equals("anonymousUser") ? Constants.SYSTEM_ACCOUNT : userName);
    }
}
