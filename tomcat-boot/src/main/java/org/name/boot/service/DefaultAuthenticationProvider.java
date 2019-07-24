package org.name.boot.service;

import java.util.Collections;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class DefaultAuthenticationProvider implements AuthenticationProvider {

	public DefaultAuthenticationProvider() {
	}

	@Override
	public Authentication authenticate(final Authentication authentication) throws AuthenticationException {

		if ("admin".equalsIgnoreCase(authentication.getName())) {
			return new UsernamePasswordAuthenticationToken(
					"admin", 
					"{noop}" + "adminpwd",
					Collections.singleton(new SimpleGrantedAuthority("ROLE_ADMIN")));

		} else if ("user".equalsIgnoreCase(authentication.getName())) {
			return new UsernamePasswordAuthenticationToken(
					"user", 
					"{noop}" + "userpwd",
					Collections.singleton(new SimpleGrantedAuthority("ROLE_USER")));

		}

		throw new UsernameNotFoundException("No such user or password.");
	}

	@Override
	public boolean supports(final Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
