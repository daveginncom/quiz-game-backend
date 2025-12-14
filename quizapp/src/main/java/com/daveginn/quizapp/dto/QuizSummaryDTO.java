package com.daveginn.quizapp.dto;

import io.swagger.v3.oas.annotations.media.Schema;

/**
 * DTO for quiz summary in list views.
 * Lightweight - does not include questions.
 */
@Schema(description = "Quiz summary for listing (no questions included)")
public class QuizSummaryDTO {
    @Schema(description = "Unique identifier of the quiz", example = "2")
    private Long id;

    @Schema(description = "Title of the quiz", example = "Forming an American Identity")
    private String title;

    @Schema(description = "Number of questions in the quiz", example = "10")
    private int questionCount;

    public QuizSummaryDTO() {
    }

    public QuizSummaryDTO(Long id, String title, int questionCount) {
        this.id = id;
        this.title = title;
        this.questionCount = questionCount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getQuestionCount() {
        return questionCount;
    }

    public void setQuestionCount(int questionCount) {
        this.questionCount = questionCount;
    }
}
