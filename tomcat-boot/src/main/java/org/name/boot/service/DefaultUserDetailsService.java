package org.name.boot.service;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class DefaultUserDetailsService implements UserDetailsService {

	public DefaultUserDetailsService() {
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		if ("admin".equalsIgnoreCase(username)) {
			return new User(
					"admin", 
					"{noop}" + "adminpwd",
					Collections.singletonList(new SimpleGrantedAuthority("ROLE_ADMIN")));

		} else if ("user".equalsIgnoreCase(username)) {
			return new User(
					"user", 
					"{noop}" + "userpwd",
					Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER")));

		}

		throw new UsernameNotFoundException("No such user or password.");
	}

}
