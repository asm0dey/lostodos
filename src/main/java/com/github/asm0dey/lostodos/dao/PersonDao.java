package com.github.asm0dey.lostodos.dao;

import com.github.asm0dey.lostodos.entity.QPerson;
import com.github.asm0dey.lostodos.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

/**
 * Created by finkel on 15.03.15.
 */
@Component
public class PersonDao implements UserDetailsService {
    @Autowired
    private PersonRepository personRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        QPerson person = QPerson.person;
        return personRepository.findOne(person.email.eq(username));
    }
}
