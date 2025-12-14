package com.daveginn.quizapp.repository;

import com.daveginn.quizapp.model.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {

    /**
     * Get all quizzes with their question counts in a single efficient query.
     * Returns Object[] with: [Quiz ID, Title, Question Count]
     */
    @Query("SELECT q.id, q.title, COUNT(qu) " +
            "FROM Quiz q LEFT JOIN q.questions qu " +
            "GROUP BY q.id, q.title " +
            "ORDER BY q.id")
    List<Object[]> findAllWithQuestionCount();
}
