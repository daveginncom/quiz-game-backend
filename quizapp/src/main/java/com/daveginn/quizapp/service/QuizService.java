package com.daveginn.quizapp.service;

import com.daveginn.quizapp.dto.*;
import com.daveginn.quizapp.model.Choice;
import com.daveginn.quizapp.model.Question;
import com.daveginn.quizapp.model.Quiz;
import com.daveginn.quizapp.repository.QuizRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class QuizService {
    private final QuizRepository quizRepository;

    public QuizService(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }

    @Transactional(readOnly = true)
    public List<Quiz> getAllQuizzes() {
        return quizRepository.findAll();
    }

    /**
     * Get all quizzes as summaries (without questions) for fast listing.
     * Uses a single optimized query with GROUP BY to get question counts.
     */
    @Transactional(readOnly = true)
    public List<QuizSummaryDTO> getAllQuizSummaries() {
        List<Object[]> results = quizRepository.findAllWithQuestionCount();

        return results.stream()
                .map(row -> new QuizSummaryDTO(
                        (Long) row[0], // id
                        (String) row[1], // title
                        ((Long) row[2]).intValue() // question count
                ))
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public Optional<Quiz> getQuizById(Long id) {
        return quizRepository.findById(id);
    }

    public Quiz createQuiz(Quiz quiz) {
        return quizRepository.save(quiz);
    }

    public Optional<Quiz> updateQuiz(Long id, Quiz updatedQuiz) {
        return quizRepository.findById(id)
                .map(existingQuiz -> {
                    existingQuiz.setTitle(updatedQuiz.getTitle());
                    existingQuiz.setQuestions(updatedQuiz.getQuestions());
                    return quizRepository.save(existingQuiz);
                });
    }

    public boolean deleteQuiz(Long id) {
        if (quizRepository.existsById(id)) {
            quizRepository.deleteById(id);
            return true;
        }
        return false;
    }

    /**
     * Get quiz for playing - excludes correct answer flags to prevent cheating.
     */
    @Transactional(readOnly = true)
    public Optional<QuizPlayDTO> getQuizForPlay(Long id) {
        return quizRepository.findById(id)
                .map(quiz -> {
                    // Force fetch questions and choices within transaction
                    quiz.getQuestions().size();
                    quiz.getQuestions().forEach(q -> q.getChoices().size());
                    return convertToPlayDTO(quiz);
                });
    }

    /**
     * Validate a submitted answer for a specific question.
     */
    @Transactional(readOnly = true)
    public Optional<AnswerResultDTO> validateAnswer(Long quizId, Long questionId, Long choiceId) {
        return quizRepository.findById(quizId)
                .flatMap(quiz -> {
                    // Force fetch questions and choices within transaction
                    quiz.getQuestions().forEach(q -> q.getChoices().size());
                    return quiz.getQuestions().stream()
                            .filter(q -> q.getId().equals(questionId))
                            .findFirst()
                            .flatMap(question -> validateQuestionAnswer(question, choiceId));
                });
    }

    private Optional<AnswerResultDTO> validateQuestionAnswer(Question question, Long choiceId) {
        // Find the submitted choice
        Optional<Choice> submittedChoice = question.getChoices().stream()
                .filter(c -> c.getId().equals(choiceId))
                .findFirst();

        if (submittedChoice.isEmpty()) {
            return Optional.empty(); // Invalid choice ID
        }

        // Find the correct choice
        Choice correctChoice = question.getChoices().stream()
                .filter(Choice::isCorrect)
                .findFirst()
                .orElseThrow(() -> new IllegalStateException("Question has no correct answer"));

        boolean isCorrect = submittedChoice.get().isCorrect();
        return Optional.of(new AnswerResultDTO(isCorrect, correctChoice.getId()));
    }

    private QuizPlayDTO convertToPlayDTO(Quiz quiz) {
        List<QuestionPlayDTO> questions = quiz.getQuestions().stream()
                .map(this::convertToQuestionPlayDTO)
                .collect(Collectors.toList());

        return new QuizPlayDTO(quiz.getId(), quiz.getTitle(), questions);
    }

    private QuestionPlayDTO convertToQuestionPlayDTO(Question question) {
        List<ChoicePlayDTO> choices = question.getChoices().stream()
                .map(c -> new ChoicePlayDTO(c.getId(), c.getText()))
                .collect(Collectors.toList());

        return new QuestionPlayDTO(question.getId(), question.getQuestion(), choices);
    }
}
