package com.daveginn.quizapp.controller;

import com.daveginn.quizapp.dto.AnswerResultDTO;
import com.daveginn.quizapp.dto.AnswerSubmissionDTO;
import com.daveginn.quizapp.dto.QuizPlayDTO;
import com.daveginn.quizapp.model.Choice;
import com.daveginn.quizapp.model.Question;
import com.daveginn.quizapp.model.Quiz;
import com.daveginn.quizapp.repository.QuizRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ActiveProfiles;

import java.util.ArrayList;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ActiveProfiles("test")
class QuizPlayControllerIntegrationTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private QuizRepository quizRepository;

    private Quiz testQuiz;
    private Question testQuestion;
    private Choice correctChoice;
    private Choice incorrectChoice;

    @BeforeEach
    void setUp() {
        quizRepository.deleteAll();

        // Create test quiz with question and choices
        testQuiz = new Quiz();
        testQuiz.setTitle("Test Quiz");

        testQuestion = new Question();
        testQuestion.setQuestion("What is 2+2?");
        testQuestion.setQuiz(testQuiz);

        correctChoice = new Choice();
        correctChoice.setText("4");
        correctChoice.setCorrect(true);
        correctChoice.setQuestion(testQuestion);

        incorrectChoice = new Choice();
        incorrectChoice.setText("5");
        incorrectChoice.setCorrect(false);
        incorrectChoice.setQuestion(testQuestion);

        testQuestion.setChoices(new ArrayList<>());
        testQuestion.getChoices().add(correctChoice);
        testQuestion.getChoices().add(incorrectChoice);

        testQuiz.setQuestions(new ArrayList<>());
        testQuiz.getQuestions().add(testQuestion);

        testQuiz = quizRepository.save(testQuiz);
        testQuestion = testQuiz.getQuestions().get(0);
        correctChoice = testQuestion.getChoices().stream()
                .filter(Choice::isCorrect)
                .findFirst()
                .orElseThrow();
        incorrectChoice = testQuestion.getChoices().stream()
                .filter(c -> !c.isCorrect())
                .findFirst()
                .orElseThrow();
    }

    @Test
    void getQuizForPlay_ShouldReturnQuizWithoutCorrectFlags() {
        // When
        ResponseEntity<QuizPlayDTO> response = restTemplate.getForEntity(
                "/api/quizzes/" + testQuiz.getId() + "/play",
                QuizPlayDTO.class);

        // Then
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        QuizPlayDTO quiz = response.getBody();
        assertThat(quiz).isNotNull();
        assertThat(quiz.getId()).isEqualTo(testQuiz.getId());
        assertThat(quiz.getTitle()).isEqualTo("Test Quiz");
        assertThat(quiz.getQuestions()).hasSize(1);
        assertThat(quiz.getQuestions().get(0).getChoices()).hasSize(2);

        // Verify choices don't have isCorrect field by checking JSON doesn't contain it
        // In actual DTO, there's no isCorrect field at all
        assertThat(quiz.getQuestions().get(0).getChoices().get(0).getText()).isIn("4", "5");
    }

    @Test
    void getQuizForPlay_ShouldReturn404ForNonExistentQuiz() {
        // When
        ResponseEntity<QuizPlayDTO> response = restTemplate.getForEntity(
                "/api/quizzes/99999/play",
                QuizPlayDTO.class);

        // Then
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.NOT_FOUND);
    }

    @Test
    void submitAnswer_ShouldReturnCorrectForCorrectAnswer() {
        // Given
        AnswerSubmissionDTO submission = new AnswerSubmissionDTO(correctChoice.getId());

        // When
        ResponseEntity<AnswerResultDTO> response = restTemplate.postForEntity(
                "/api/quizzes/" + testQuiz.getId() + "/questions/" + testQuestion.getId() + "/submit",
                submission,
                AnswerResultDTO.class);

        // Then
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        AnswerResultDTO result = response.getBody();
        assertThat(result).isNotNull();
        assertThat(result.isCorrect()).isTrue();
        assertThat(result.getCorrectChoiceId()).isEqualTo(correctChoice.getId());
    }

    @Test
    void submitAnswer_ShouldReturnIncorrectForWrongAnswer() {
        // Given
        AnswerSubmissionDTO submission = new AnswerSubmissionDTO(incorrectChoice.getId());

        // When
        ResponseEntity<AnswerResultDTO> response = restTemplate.postForEntity(
                "/api/quizzes/" + testQuiz.getId() + "/questions/" + testQuestion.getId() + "/submit",
                submission,
                AnswerResultDTO.class);

        // Then
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        AnswerResultDTO result = response.getBody();
        assertThat(result).isNotNull();
        assertThat(result.isCorrect()).isFalse();
        assertThat(result.getCorrectChoiceId()).isEqualTo(correctChoice.getId());
    }

    @Test
    void submitAnswer_ShouldReturn400ForInvalidChoiceId() {
        // Given
        AnswerSubmissionDTO submission = new AnswerSubmissionDTO(99999L);

        // When
        ResponseEntity<AnswerResultDTO> response = restTemplate.postForEntity(
                "/api/quizzes/" + testQuiz.getId() + "/questions/" + testQuestion.getId() + "/submit",
                submission,
                AnswerResultDTO.class);

        // Then
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.BAD_REQUEST);
    }

    @Test
    void submitAnswer_ShouldReturn400ForInvalidQuestionId() {
        // Given
        AnswerSubmissionDTO submission = new AnswerSubmissionDTO(correctChoice.getId());

        // When
        ResponseEntity<AnswerResultDTO> response = restTemplate.postForEntity(
                "/api/quizzes/" + testQuiz.getId() + "/questions/99999/submit",
                submission,
                AnswerResultDTO.class);

        // Then
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.BAD_REQUEST);
    }
}
