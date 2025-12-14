package com.daveginn.quizapp.controller;

import com.daveginn.quizapp.dto.AnswerResultDTO;
import com.daveginn.quizapp.dto.AnswerSubmissionDTO;
import com.daveginn.quizapp.dto.QuizPlayDTO;
import com.daveginn.quizapp.dto.QuizSummaryDTO;
import com.daveginn.quizapp.model.Quiz;
import com.daveginn.quizapp.service.QuizService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/quizzes")
@CrossOrigin(origins = "*")
@Tag(name = "Quiz Management", description = "APIs for managing and playing quizzes")
public class QuizController {
    private final QuizService quizService;

    public QuizController(QuizService quizService) {
        this.quizService = quizService;
    }

    @Operation(summary = "Get all quizzes", description = "Retrieve a list of all available quizzes as summaries (no questions). Use /play endpoint to get questions for gameplay.")
    @ApiResponse(responseCode = "200", description = "Successfully retrieved list of quiz summaries")
    @GetMapping
    public ResponseEntity<List<QuizSummaryDTO>> getAllQuizzes() {
        return ResponseEntity.ok(quizService.getAllQuizSummaries());
    }

    @Operation(summary = "Get quiz by ID", description = "Retrieve a specific quiz with full details including correct answers. Use for admin/editing purposes only.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Quiz found"),
            @ApiResponse(responseCode = "404", description = "Quiz not found")
    })
    @GetMapping("/{id}")
    public ResponseEntity<Quiz> getQuizById(
            @Parameter(description = "ID of the quiz to retrieve") @PathVariable Long id) {
        return quizService.getQuizById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @Operation(summary = "Create a new quiz", description = "Create a new quiz with questions and choices")
    @ApiResponse(responseCode = "201", description = "Quiz created successfully")
    @PostMapping
    public ResponseEntity<Quiz> createQuiz(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Quiz object to create") @RequestBody Quiz quiz) {
        Quiz createdQuiz = quizService.createQuiz(quiz);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdQuiz);
    }

    @Operation(summary = "Update a quiz", description = "Update an existing quiz by ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Quiz updated successfully"),
            @ApiResponse(responseCode = "404", description = "Quiz not found")
    })
    @PutMapping("/{id}")
    public ResponseEntity<Quiz> updateQuiz(
            @Parameter(description = "ID of the quiz to update") @PathVariable Long id,
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Updated quiz object") @RequestBody Quiz quiz) {
        return quizService.updateQuiz(id, quiz)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @Operation(summary = "Delete a quiz", description = "Delete a quiz by ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Quiz deleted successfully"),
            @ApiResponse(responseCode = "404", description = "Quiz not found")
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteQuiz(
            @Parameter(description = "ID of the quiz to delete") @PathVariable Long id) {
        boolean deleted = quizService.deleteQuiz(id);
        return deleted ? ResponseEntity.noContent().build() : ResponseEntity.notFound().build();
    }

    @Operation(summary = "Get quiz for playing (SECURE)", description = "Retrieve quiz questions WITHOUT correct answer flags. This is the secure endpoint for gameplay that prevents answer exposure in the frontend. Answers are validated server-side via the /submit endpoint.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Quiz retrieved successfully for play", content = @Content(schema = @Schema(implementation = QuizPlayDTO.class))),
            @ApiResponse(responseCode = "404", description = "Quiz not found")
    })
    @GetMapping("/{id}/play")
    public ResponseEntity<QuizPlayDTO> getQuizForPlay(
            @Parameter(description = "ID of the quiz to play") @PathVariable Long id) {
        return quizService.getQuizForPlay(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @Operation(summary = "Submit answer for validation (SECURE)", description = "Submit a user's answer choice for server-side validation. Returns whether the answer is correct and reveals the correct choice ID. This ensures answer validation happens on the server where correct answers are stored securely.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Answer validated successfully", content = @Content(schema = @Schema(implementation = AnswerResultDTO.class))),
            @ApiResponse(responseCode = "400", description = "Invalid choice ID or question ID")
    })
    @PostMapping("/{quizId}/questions/{questionId}/submit")
    public ResponseEntity<AnswerResultDTO> submitAnswer(
            @Parameter(description = "ID of the quiz") @PathVariable Long quizId,
            @Parameter(description = "ID of the question being answered") @PathVariable Long questionId,
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Answer submission containing the selected choice ID") @RequestBody AnswerSubmissionDTO submission) {

        return quizService.validateAnswer(quizId, questionId, submission.getChoiceId())
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.badRequest().build());
    }
}
