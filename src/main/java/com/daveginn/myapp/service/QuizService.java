package com.daveginn.myapp.service;

import com.daveginn.myapp.model.Choice;
import com.daveginn.myapp.model.Question;
import com.daveginn.myapp.model.Quiz;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class QuizService {
    private final List<Quiz> quizzes = new ArrayList<>();

    public QuizService() {
        // Initialize with the British America quiz
        initializeBritishAmericaQuiz();
    }

    private void initializeBritishAmericaQuiz() {
        Quiz quiz = new Quiz();
        quiz.setId(1L);
        quiz.setTitle("British America");
        
        List<Question> questions = new ArrayList<>();
        
        questions.add(createQuestion(
            "Who was the bridge between the Powhatan and Jamestown?",
            Arrays.asList(
                new Choice("Pocahontas", true),
                new Choice("Sacagawea", false),
                new Choice("Anne Hutchinson", false),
                new Choice("Deborah Sampson", false)
            )
        ));
        
        questions.add(createQuestion(
            "What was the first successful British colony in North America?",
            Arrays.asList(
                new Choice("Jamestown", true),
                new Choice("Roanoke", false),
                new Choice("Plymouth", false),
                new Choice("Quebec", false)
            )
        ));
        
        questions.add(createQuestion(
            "What was the Puritan name for their church?",
            Arrays.asList(
                new Choice("The Congregationalist Church", true),
                new Choice("The Anglican Church", false),
                new Choice("The Presbyterian Church", false),
                new Choice("The Quaker Meetinghouse", false)
            )
        ));
        
        questions.add(createQuestion(
            "Who founded Rhode Island after dissenting from the Puritan rulers of Massachusetts?",
            Arrays.asList(
                new Choice("Roger Williams", true),
                new Choice("John Winthrop", false),
                new Choice("William Bradford", false),
                new Choice("Thomas Hooker", false)
            )
        ));
        
        questions.add(createQuestion(
            "Which English King was beheaded following the English Civil War?",
            Arrays.asList(
                new Choice("Charles I", true),
                new Choice("James II", false),
                new Choice("George I", false),
                new Choice("Henry VIII", false)
            )
        ));
        
        quiz.setQuestions(questions);
        quizzes.add(quiz);
    }

    private Question createQuestion(String questionText, List<Choice> choices) {
        Question question = new Question();
        question.setQuestion(questionText);
        question.setChoices(choices);
        return question;
    }

    public List<Quiz> getAllQuizzes() {
        return new ArrayList<>(quizzes);
    }

    public Optional<Quiz> getQuizById(Long id) {
        return quizzes.stream()
                .filter(quiz -> quiz.getId().equals(id))
                .findFirst();
    }

    public Quiz createQuiz(Quiz quiz) {
        long newId = quizzes.stream()
                .mapToLong(Quiz::getId)
                .max()
                .orElse(0L) + 1;
        quiz.setId(newId);
        quizzes.add(quiz);
        return quiz;
    }

    public Optional<Quiz> updateQuiz(Long id, Quiz updatedQuiz) {
        for (int i = 0; i < quizzes.size(); i++) {
            if (quizzes.get(i).getId().equals(id)) {
                updatedQuiz.setId(id);
                quizzes.set(i, updatedQuiz);
                return Optional.of(updatedQuiz);
            }
        }
        return Optional.empty();
    }

    public boolean deleteQuiz(Long id) {
        return quizzes.removeIf(quiz -> quiz.getId().equals(id));
    }
}
