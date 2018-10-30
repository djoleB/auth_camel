package Authentication.Auth;

import javax.sql.DataSource;

import org.apache.camel.CamelContext;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.camel.impl.SimpleRegistry;
import org.apache.commons.dbcp.BasicDataSource;

import Authentication.Auth.routes.Oauth2;

public class Main {

	public static void main(String[] args) throws Exception {

		DataSource dataSource = setupDataSource("jdbc:mysql://5.9.71.50:3306");

		SimpleRegistry reg = new SimpleRegistry();
		reg.put("myDataSource", dataSource);

		CamelContext context = new DefaultCamelContext(reg);

		context.addRoutes(new Oauth2());
		context.start();
		Thread.sleep(1000000);
		context.stop();

	}

	private static DataSource setupDataSource(String connectURI) {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUsername("shift_u_r");
		ds.setPassword("1rZ4TT0LT1");
		ds.setUrl(connectURI);
		return ds;
	}

}
