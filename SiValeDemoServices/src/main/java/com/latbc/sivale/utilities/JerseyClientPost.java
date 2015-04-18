package com.latbc.sivale.utilities;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class JerseyClientPost {

	public static void main(String[] args) {

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://localhost:8080/SiValeDemoServices/services/sendParameters");

			String input = "{\"url\":\"re=?ATEERFDFDFDE12212&rr=SAPL8501122&tt=009092182y1.212121&id=ERERE-FGGFG-SASA\",\"userId\":\"ERERT221\",\"authorizationId\":\"12756542312\"}";

			ClientResponse response = webResource.type("application/json")
					.post(ClientResponse.class, input);

			if (response.getStatus() != 201) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			System.out.println("Output from Server .... \n");
			String output = response.getEntity(String.class);
			System.out.println(output);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}
}
