package com.daveginn.quizapp.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.servers.Server;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class OpenAPIConfig {

    @Bean
    public OpenAPI quizGameOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Quiz Game API")
                        .description("API for managing and playing educational quizzes. " +
                                "Use /api/quizzes/{id}/play endpoint for gameplay to ensure answers remain secure on the server.")
                        .version("1.0.0")
                        .contact(new Contact()
                                .name("Dave Ginn")
                                .url("https://daveginn.com")))
                .servers(List.of(
                        new Server().url("http://localhost:8080").description("Local Development"),
                        new Server().url("https://quizapp.azurewebsites.net").description("Production")));
    }
}
