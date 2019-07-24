package org.name.security.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = { "/token" }, produces = MediaType.APPLICATION_JSON_VALUE)
@Validated
public class TokenResource {

	@Autowired
	private DefaultTokenServices tokenServices;

	@RequestMapping(method = RequestMethod.GET, path = "/cancel")
	@ResponseStatus(HttpStatus.OK)
	public void revokeToken(Authentication authentication) {
		tokenServices.revokeToken(((OAuth2AuthenticationDetails) authentication.getDetails()).getTokenValue());
	}

}
