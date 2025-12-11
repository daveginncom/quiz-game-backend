package com.daveginn.quizapp.repository;

import com.daveginn.quizapp.model.Choice;
import com.daveginn.quizapp.model.Question;
import com.daveginn.quizapp.model.Quiz;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
class QuizRepositoryIntegrationTest {

    @Autowired
    private QuizRepository quizRepository;

    @BeforeEach
    void setUp() {
        quizRepository.deleteAll();
    }

    @Test
    void save_ShouldPersistQuizWithQuestionsAndChoices() {
        // Given
        Quiz quiz = new Quiz();
        quiz.setTitle("Repository Test Quiz");

        Question question = new Question();
        question.setQuestion("Test Question");
        question.setQuiz(quiz);

        Choice choice1 = new Choice();
        choice1.setText("Choice 1");
        choice1.setCorrect(true);
        choice1.setQuestion(question);

        Choice choice2 = new Choice();
        choice2.setText("Choice 2");
        choice2.setCorrect(false);
        choice2.setQuestion(question);

        question.setChoices(List.of(choice1, choice2));
        quiz.setQuestions(List.of(question));

        // When
        Quiz savedQuiz = quizRepository.save(quiz);

        // Then
        assertThat(savedQuiz.getId()).isNotNull();
        assertThat(savedQuiz.getTitle()).isEqualTo("Repository Test Quiz");
        assertThat(savedQuiz.getQuestions()).hasSize(1);
        assertThat(savedQuiz.getQuestions().get(0).getChoices()).hasSize(2);
        assertThat(savedQuiz.getCreatedAt()).isNotNull();
        assertThat(savedQuiz.getUpdatedAt()).isNotNull();
    }

    @Test
    void findById_WhenQuizExists_ShouldReturnQuizWithRelations() {
        // Given
        Quiz quiz = createTestQuiz("Find Test Quiz");
        Quiz savedQuiz = quizRepository.save(quiz);

        // When
        Optional<Quiz> found = quizRepository.findById(savedQuiz.getId());

        // Then
        assertThat(found).isPresent();
        assertThat(found.get().getTitle()).isEqualTo("Find Test Quiz");
        assertThat(found.get().getQuestions()).hasSize(1);
        assertThat(found.get().getQuestions().get(0).getChoices()).hasSize(2);
    }

    @Test
    void findById_WhenQuizDoesNotExist_ShouldReturnEmpty() {
        // When
        Optional<Quiz> found = quizRepository.findById(99999L);

        // Then
        assertThat(found).isEmpty();
    }

    @Test
    void findAll_ShouldReturnAllQuizzes() {
        // Given
        quizRepository.save(createTestQuiz("Quiz 1"));
        quizRepository.save(createTestQuiz("Quiz 2"));
        quizRepository.save(createTestQuiz("Quiz 3"));

        // When
        List<Quiz> quizzes = quizRepository.findAll();

        // Then
        assertThat(quizzes).hasSize(3);
        assertThat(quizzes).extracting(Quiz::getTitle)
                .containsExactlyInAnyOrder("Quiz 1", "Quiz 2", "Quiz 3");
    }

    @Test
    void delete_ShouldRemoveQuizAndCascadeToQuestionsAndChoices() {
        // Given
        Quiz quiz = createTestQuiz("Delete Test Quiz");
        Quiz savedQuiz = quizRepository.save(quiz);
        Long quizId = savedQuiz.getId();

        // When
        quizRepository.deleteById(quizId);

        // Then
        Optional<Quiz> found = quizRepository.findById(quizId);
        assertThat(found).isEmpty();
    }

    @Test
    void update_ShouldModifyExistingQuiz() {
        // Given
        Quiz quiz = createTestQuiz("Original Title");
        Quiz savedQuiz = quizRepository.save(quiz);

        // When
        savedQuiz.setTitle("Updated Title");
        Quiz updatedQuiz = quizRepository.save(savedQuiz);

        // Then
        Optional<Quiz> found = quizRepository.findById(updatedQuiz.getId());
        assertThat(found).isPresent();
        assertThat(found.get().getTitle()).isEqualTo("Updated Title");
        assertThat(found.get().getUpdatedAt()).isAfter(found.get().getCreatedAt());
    }

    @Test
    void save_ShouldHandleMultipleQuestions() {
        // Given
        Quiz quiz = new Quiz();
        quiz.setTitle("Multi-Question Quiz");

        Question q1 = createQuestion("Question 1", 1);
        q1.setQuiz(quiz);
        q1.setChoices(List.of(createChoice("A1", true, 1, q1), createChoice("A2", false, 2, q1)));

        Question q2 = createQuestion("Question 2", 2);
        q2.setQuiz(quiz);
        q2.setChoices(List.of(createChoice("B1", false, 1, q2), createChoice("B2", true, 2, q2)));

        quiz.setQuestions(List.of(q1, q2));

        // When
        Quiz savedQuiz = quizRepository.save(quiz);

        // Then
        Optional<Quiz> found = quizRepository.findById(savedQuiz.getId());
        assertThat(found).isPresent();
        assertThat(found.get().getQuestions()).hasSize(2);
        assertThat(found.get().getQuestions().get(0).getChoices()).hasSize(2);
        assertThat(found.get().getQuestions().get(1).getChoices()).hasSize(2);
    }

    @Test
    void existsById_ShouldReturnTrueWhenQuizExists() {
        // Given
        Quiz quiz = createTestQuiz("Exists Test");
        Quiz savedQuiz = quizRepository.save(quiz);

        // When/Then
        assertThat(quizRepository.existsById(savedQuiz.getId())).isTrue();
        assertThat(quizRepository.existsById(99999L)).isFalse();
    }

    private Quiz createTestQuiz(String title) {
        Quiz quiz = new Quiz();
        quiz.setTitle(title);

        Question question = createQuestion("Test Question", 1);
        question.setQuiz(quiz);

        Choice choice1 = createChoice("Choice 1", true, 1, question);
        Choice choice2 = createChoice("Choice 2", false, 2, question);

        question.setChoices(List.of(choice1, choice2));
        quiz.setQuestions(List.of(question));

        return quiz;
    }

    private Question createQuestion(String text, int order) {
        Question question = new Question();
        question.setQuestion(text);
        return question;
    }

    private Choice createChoice(String text, boolean correct, int order, Question question) {
        Choice choice = new Choice();
        choice.setText(text);
        choice.setCorrect(correct);
        choice.setQuestion(question);
        return choice;
    }
}
