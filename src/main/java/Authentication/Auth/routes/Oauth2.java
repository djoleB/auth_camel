package Authentication.Auth.routes;

import org.apache.camel.builder.RouteBuilder;

public class Oauth2 extends RouteBuilder {

	@Override
	public void configure() throws Exception {

		/*restConfiguration()
        .component("restlet")
        .host("localhost").port("8080");
		
		rest("/api/customers")
	    .get().to("direct:nesto")
	    .post().consumes("application/json").to("direct:nesto2");
		
		from("direct:nesto")
		.setBody().constant("{\"method\":\"GET\"}").to("mock:nesto");
		
		from("direct:nesto2")
		.setBody().constant("{\"method\":\"POST\"}").to("mock:nesto");
		*/
		from("timer:foo?period=15000")
		.log("Started!")
		.to("mock:123321");
		
	}

}
