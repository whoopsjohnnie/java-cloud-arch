package org.name.security.resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = { "/api" }, produces = MediaType.APPLICATION_JSON_VALUE)
@Validated
public class APIResource {

	@RequestMapping(method = RequestMethod.GET, path = "/all")
	@ResponseStatus(HttpStatus.OK)
	public Object allPath() {
		return new String("Everyone logged in can see this.");
	}
	
	@RequestMapping(method = RequestMethod.GET, path = "/user")
	@ResponseStatus(HttpStatus.OK)
	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	public Object userPath() {
		return new String("All members of the user role can see this.");
	}

	@RequestMapping(method = RequestMethod.GET, path = "/admin")
	@ResponseStatus(HttpStatus.OK)
	@Secured({ "ROLE_ADMIN" })
	public Object adminPath() {
		return new String("Only members of the admin role can see this.");
	}

}
