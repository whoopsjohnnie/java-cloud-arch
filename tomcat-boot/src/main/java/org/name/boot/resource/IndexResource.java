package org.name.boot.resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexResource {

	@RequestMapping("/")
	public String indexPage() {
		return "index";
	}

	@RequestMapping("/protected")
	public String getPing() {
		return "protected";
	}
	
}
