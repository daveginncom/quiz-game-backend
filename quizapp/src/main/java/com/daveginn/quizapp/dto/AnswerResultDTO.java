package com.daveginn.quizapp.dto;

import io.swagger.v3.oas.annotations.media.Schema;

/**
 * DTO for answer validation result sent back to frontend.
 */
@Schema(description = "Result of answer validation")
public class AnswerResultDTO {
    @Schema(description = "Whether the submitted answer was correct", example = "true")
    private boolean correct;

    @Schema(description = "ID of the correct choice (always returned for learning purposes)", example = "42")
    private Long correctChoiceId;

    @Schema(description = "Optional explanation for the answer", example = "George Washington was the first President of the United States.")
    private String explanation;

    public AnswerResultDTO() {
    }

    public AnswerResultDTO(boolean correct, Long correctChoiceId) {
        this.correct = correct;
        this.correctChoiceId = correctChoiceId;
    }

    public AnswerResultDTO(boolean correct, Long correctChoiceId, String explanation) {
        this.correct = correct;
        this.correctChoiceId = correctChoiceId;
        this.explanation = explanation;
    }

    public boolean isCorrect() {
        return correct;
    }

    public void setCorrect(boolean correct) {
        this.correct = correct;
    }

    public Long getCorrectChoiceId() {
        return correctChoiceId;
    }

    public void setCorrectChoiceId(Long correctChoiceId) {
        this.correctChoiceId = correctChoiceId;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }
}
