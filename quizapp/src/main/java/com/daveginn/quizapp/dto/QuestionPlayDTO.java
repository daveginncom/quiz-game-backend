package com.daveginn.quizapp.dto;

import io.swagger.v3.oas.annotations.media.Schema;

import java.util.ArrayList;
import java.util.List;

/**
 * DTO for Question data sent to frontend during quiz play.
 * Contains choices without correct answer flags.
 */
@Schema(description = "A quiz question with answer choices (correct flags hidden)")
public class QuestionPlayDTO {
    @Schema(description = "Unique identifier of the question", example = "5")
    private Long id;

    @Schema(description = "Text of the question", example = "Who was the first President of the United States?")
    private String question;

    @Schema(description = "List of possible answer choices")
    private List<ChoicePlayDTO> choices = new ArrayList<>();

    public QuestionPlayDTO() {
    }

    public QuestionPlayDTO(Long id, String question, List<ChoicePlayDTO> choices) {
        this.id = id;
        this.question = question;
        this.choices = choices;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<ChoicePlayDTO> getChoices() {
        return choices;
    }

    public void setChoices(List<ChoicePlayDTO> choices) {
        this.choices = choices;
    }
}
