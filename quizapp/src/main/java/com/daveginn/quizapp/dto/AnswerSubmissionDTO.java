package com.daveginn.quizapp.dto;

import io.swagger.v3.oas.annotations.media.Schema;

/**
 * DTO for answer submission from frontend.
 */
@Schema(description = "Request body for submitting an answer to a question")
public class AnswerSubmissionDTO {
    @Schema(description = "ID of the selected choice", example = "42", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long choiceId;

    public AnswerSubmissionDTO() {
    }

    public AnswerSubmissionDTO(Long choiceId) {
        this.choiceId = choiceId;
    }

    public Long getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(Long choiceId) {
        this.choiceId = choiceId;
    }
}
