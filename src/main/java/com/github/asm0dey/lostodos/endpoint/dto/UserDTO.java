package com.github.asm0dey.lostodos.endpoint.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * Created by finkel on 21.03.15.
 */
@Data
@NoArgsConstructor
public class UserDTO {
    private List<String> roles;
    @NotNull
    @Email
    private String email;
    @NotNull
    private String login;
    @NotNull
    private String password;

    public UserDTO(String login, String password, String email, List<String> roles) {
        this.email = email;
        this.login = login;
        this.password = password;
        this.roles = roles;
    }

}
