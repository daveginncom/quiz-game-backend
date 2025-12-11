package com.daveginn.quizapp.controller;

import com.daveginn.quizapp.model.Choice;
import com.daveginn.quizapp.model.Question;
import com.daveginn.quizapp.model.Quiz;
import com.daveginn.quizapp.repository.QuizRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
class QuizControllerIntegrationTest {

    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext webApplicationContext;

    private ObjectMapper objectMapper = new ObjectMapper();

    @Autowired
    private QuizRepository quizRepository;

    private Quiz testQuiz;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();

        quizRepository.deleteAll();

        testQuiz = new Quiz();
        testQuiz.setTitle("Integration Test Quiz");

        Question question = new Question();
        question.setQuestion("What is 2+2?");
        question.setQuiz(testQuiz);

        Choice choice1 = new Choice();
        choice1.setText("3");
        choice1.setCorrect(false);
        choice1.setQuestion(question);

        Choice choice2 = new Choice();
        choice2.setText("4");
        choice2.setCorrect(true);
        choice2.setQuestion(question);

        question.setChoices(List.of(choice1, choice2));
        testQuiz.setQuestions(List.of(question));

        testQuiz = quizRepository.save(testQuiz);
    }

    @Test
    void getAllQuizzes_ShouldReturnListOfQuizzes() throws Exception {
        mockMvc.perform(get("/api/quizzes"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].title").value("Integration Test Quiz"))
                .andExpect(jsonPath("$[0].questions", hasSize(1)))
                .andExpect(jsonPath("$[0].questions[0].question").value("What is 2+2?"))
                .andExpect(jsonPath("$[0].questions[0].choices", hasSize(2)));
    }

    @Test
    void getQuizById_WhenQuizExists_ShouldReturnQuiz() throws Exception {
        mockMvc.perform(get("/api/quizzes/{id}", testQuiz.getId()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.id").value(testQuiz.getId()))
                .andExpect(jsonPath("$.title").value("Integration Test Quiz"))
                .andExpect(jsonPath("$.questions[0].choices[1].correct").value(true));
    }

    @Test
    void getQuizById_WhenQuizDoesNotExist_ShouldReturn404() throws Exception {
        mockMvc.perform(get("/api/quizzes/99999"))
                .andExpect(status().isNotFound());
    }

    @Test
    void createQuiz_ShouldReturnCreatedQuiz() throws Exception {
        Quiz newQuiz = new Quiz();
        newQuiz.setTitle("New Quiz");
        newQuiz.setQuestions(new ArrayList<>());

        mockMvc.perform(post("/api/quizzes")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(newQuiz)))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.id").exists())
                .andExpect(jsonPath("$.title").value("New Quiz"));
    }

    @Test
    void updateQuiz_WhenQuizExists_ShouldReturnUpdatedQuiz() throws Exception {
        Quiz updatedQuiz = new Quiz();
        updatedQuiz.setTitle("Updated Quiz Title");
        updatedQuiz.setQuestions(new ArrayList<>());

        mockMvc.perform(put("/api/quizzes/{id}", testQuiz.getId())
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(updatedQuiz)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(testQuiz.getId()))
                .andExpect(jsonPath("$.title").value("Updated Quiz Title"));
    }

    @Test
    void updateQuiz_WhenQuizDoesNotExist_ShouldReturn404() throws Exception {
        Quiz updatedQuiz = new Quiz();
        updatedQuiz.setTitle("Updated Quiz");

        mockMvc.perform(put("/api/quizzes/99999")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(updatedQuiz)))
                .andExpect(status().isNotFound());
    }

    @Test
    void deleteQuiz_WhenQuizExists_ShouldReturn204() throws Exception {
        mockMvc.perform(delete("/api/quizzes/{id}", testQuiz.getId()))
                .andExpect(status().isNoContent());

        // Verify it was actually deleted
        mockMvc.perform(get("/api/quizzes/{id}", testQuiz.getId()))
                .andExpect(status().isNotFound());
    }

    @Test
    void deleteQuiz_WhenQuizDoesNotExist_ShouldReturn404() throws Exception {
        mockMvc.perform(delete("/api/quizzes/99999"))
                .andExpect(status().isNotFound());
    }
}
