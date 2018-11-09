package Authentication.Auth.routes;

import org.apache.camel.builder.RouteBuilder;

public class Oauth2 extends RouteBuilder {

	@Override
	public void configure() throws Exception {

		from("timer:foo?period=15000")
		.log("Started!")
		.to("https://jsonplaceholder.typicode.com/todos/1")
		.log("${body}")
		.to("mock:123321");
		
	}

}
