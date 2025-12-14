package com.daveginn.quizapp.dto;

import io.swagger.v3.oas.annotations.media.Schema;

import java.util.ArrayList;
import java.util.List;

/**
 * DTO for Quiz data sent to frontend during quiz play.
 * Questions and choices do not include correct answer flags.
 */
@Schema(description = "Quiz data for gameplay (secure - no correct answer flags)")
public class QuizPlayDTO {
    @Schema(description = "Unique identifier of the quiz", example = "2")
    private Long id;

    @Schema(description = "Title of the quiz", example = "Forming an American Identity")
    private String title;

    @Schema(description = "List of questions in the quiz")
    private List<QuestionPlayDTO> questions = new ArrayList<>();

    public QuizPlayDTO() {
    }

    public QuizPlayDTO(Long id, String title, List<QuestionPlayDTO> questions) {
        this.id = id;
        this.title = title;
        this.questions = questions;
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

    public List<QuestionPlayDTO> getQuestions() {
        return questions;
    }

    public void setQuestions(List<QuestionPlayDTO> questions) {
        this.questions = questions;
    }
}
