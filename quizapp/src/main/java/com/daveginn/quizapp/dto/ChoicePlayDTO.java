package com.daveginn.quizapp.dto;

import io.swagger.v3.oas.annotations.media.Schema;

/**
 * DTO for Choice data sent to frontend during quiz play.
 * Excludes the isCorrect flag to prevent answer exposure.
 */
@Schema(description = "A choice option for a quiz question (without correct answer flag for security)")
public class ChoicePlayDTO {
    @Schema(description = "Unique identifier of the choice", example = "1")
    private Long id;

    @Schema(description = "Text content of the choice", example = "George Washington")
    private String text;

    public ChoicePlayDTO() {
    }

    public ChoicePlayDTO(Long id, String text) {
        this.id = id;
        this.text = text;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
