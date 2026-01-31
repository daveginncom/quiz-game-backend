package com.daveginn.quizapp.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.servers.Server;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class OpenAPIConfig {

        @Value("${server.url:}")
        private String serverUrl;

        @Value("${server.port:8080}")
        private String serverPort;

        @Bean
        public OpenAPI quizGameOpenAPI() {
                List<Server> servers = new ArrayList<>();

                // Add configured server URL if provided (for Azure Container Apps)
                if (serverUrl != null && !serverUrl.isEmpty()) {
                        servers.add(new Server().url(serverUrl).description("Deployed Environment"));
                }

                // Always add localhost as fallback
                servers.add(new Server().url("http://localhost:" + serverPort).description("Local Development"));

                return new OpenAPI()
                                .info(new Info()
                                                .title("Quiz Game API")
                                                .description("API for managing and playing educational quizzes. " +
                                                                "Use /api/quizzes/{id}/play endpoint for gameplay to ensure answers remain secure on the server.")
                                                .version("1.0.0")
                                                .contact(new Contact()
                                                                .name("Dave Ginn")
                                                                .url("https://daveginn.com")))
                                .servers(servers);
        }
}
