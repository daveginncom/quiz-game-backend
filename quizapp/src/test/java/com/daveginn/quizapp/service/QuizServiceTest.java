package com.daveginn.quizapp.service;

import com.daveginn.quizapp.model.Choice;
import com.daveginn.quizapp.model.Question;
import com.daveginn.quizapp.model.Quiz;
import com.daveginn.quizapp.repository.QuizRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class QuizServiceTest {

    @Mock
    private QuizRepository quizRepository;

    @InjectMocks
    private QuizService quizService;

    private Quiz testQuiz;
    private Question testQuestion;
    private Choice testChoice;

    @BeforeEach
    void setUp() {
        testQuiz = new Quiz();
        testQuiz.setId(1L);
        testQuiz.setTitle("Test Quiz");

        testQuestion = new Question();
        testQuestion.setId(1L);
        testQuestion.setQuestion("What is the capital of France?");
        testQuestion.setQuestionOrder(1);

        testChoice = new Choice();
        testChoice.setId(1L);
        testChoice.setText("Paris");
        testChoice.setCorrect(true);
        testChoice.setChoiceOrder(1);

        List<Choice> choices = new ArrayList<>();
        choices.add(testChoice);
        testQuestion.setChoices(choices);

        List<Question> questions = new ArrayList<>();
        questions.add(testQuestion);
        testQuiz.setQuestions(questions);
    }

    @Test
    void getAllQuizzes_ShouldReturnAllQuizzes() {
        // Given
        List<Quiz> quizzes = List.of(testQuiz);
        when(quizRepository.findAll()).thenReturn(quizzes);

        // When
        List<Quiz> result = quizService.getAllQuizzes();

        // Then
        assertThat(result).hasSize(1);
        assertThat(result.get(0).getTitle()).isEqualTo("Test Quiz");
        verify(quizRepository, times(1)).findAll();
    }

    @Test
    void getQuizById_WhenQuizExists_ShouldReturnQuiz() {
        // Given
        when(quizRepository.findById(1L)).thenReturn(Optional.of(testQuiz));

        // When
        Optional<Quiz> result = quizService.getQuizById(1L);

        // Then
        assertThat(result).isPresent();
        assertThat(result.get().getTitle()).isEqualTo("Test Quiz");
        verify(quizRepository, times(1)).findById(1L);
    }

    @Test
    void getQuizById_WhenQuizDoesNotExist_ShouldReturnEmpty() {
        // Given
        when(quizRepository.findById(999L)).thenReturn(Optional.empty());

        // When
        Optional<Quiz> result = quizService.getQuizById(999L);

        // Then
        assertThat(result).isEmpty();
        verify(quizRepository, times(1)).findById(999L);
    }

    @Test
    void createQuiz_ShouldSaveAndReturnQuiz() {
        // Given
        when(quizRepository.save(any(Quiz.class))).thenReturn(testQuiz);

        // When
        Quiz result = quizService.createQuiz(testQuiz);

        // Then
        assertThat(result).isNotNull();
        assertThat(result.getTitle()).isEqualTo("Test Quiz");
        verify(quizRepository, times(1)).save(testQuiz);
    }

    @Test
    void updateQuiz_WhenQuizExists_ShouldUpdateAndReturnQuiz() {
        // Given
        Quiz updatedQuiz = new Quiz();
        updatedQuiz.setTitle("Updated Quiz");
        updatedQuiz.setQuestions(new ArrayList<>());

        when(quizRepository.findById(1L)).thenReturn(Optional.of(testQuiz));
        when(quizRepository.save(any(Quiz.class))).thenReturn(testQuiz);

        // When
        Optional<Quiz> result = quizService.updateQuiz(1L, updatedQuiz);

        // Then
        assertThat(result).isPresent();
        assertThat(result.get().getTitle()).isEqualTo("Updated Quiz");
        verify(quizRepository, times(1)).findById(1L);
        verify(quizRepository, times(1)).save(any(Quiz.class));
    }

    @Test
    void updateQuiz_WhenQuizDoesNotExist_ShouldReturnEmpty() {
        // Given
        Quiz updatedQuiz = new Quiz();
        updatedQuiz.setTitle("Updated Quiz");

        when(quizRepository.findById(999L)).thenReturn(Optional.empty());

        // When
        Optional<Quiz> result = quizService.updateQuiz(999L, updatedQuiz);

        // Then
        assertThat(result).isEmpty();
        verify(quizRepository, times(1)).findById(999L);
        verify(quizRepository, never()).save(any(Quiz.class));
    }

    @Test
    void deleteQuiz_WhenQuizExists_ShouldReturnTrue() {
        // Given
        when(quizRepository.existsById(1L)).thenReturn(true);
        doNothing().when(quizRepository).deleteById(1L);

        // When
        boolean result = quizService.deleteQuiz(1L);

        // Then
        assertThat(result).isTrue();
        verify(quizRepository, times(1)).existsById(1L);
        verify(quizRepository, times(1)).deleteById(1L);
    }

    @Test
    void deleteQuiz_WhenQuizDoesNotExist_ShouldReturnFalse() {
        // Given
        when(quizRepository.existsById(999L)).thenReturn(false);

        // When
        boolean result = quizService.deleteQuiz(999L);

        // Then
        assertThat(result).isFalse();
        verify(quizRepository, times(1)).existsById(999L);
        verify(quizRepository, never()).deleteById(any());
    }
}
