-- Insert Religion Mid-term Quiz
INSERT INTO quizzes (title) VALUES ('Religion Mid-term');

-- Insert questions and choices for Religion Mid-term Quiz
-- Question 1
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Which best defines faith as a noun?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Trusting feelings', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'What we believe', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Obeying rules', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Personal opinion', false);

-- Question 2
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Faith as a verb refers to:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Church attendance', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Moral behavior', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Our response to God''s call', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Reading Scripture', false);

-- Question 3
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Which Old Testament figure exemplifies faith?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Moses', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'David', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Abraham', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Solomon', false);

-- Question 4
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Which New Testament figure exemplifies faith?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Martha', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Elizabeth', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Mary', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Mary Magdalene', false);

-- Question 5
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'How did Abraham show faith?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'He questioned God', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'He listened to God and did what He asked', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'He demanded proof', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'He followed public opinion', false);

-- Question 6
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Why is Abraham called the Father of Faith?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'He wrote Scripture', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'He performed miracles', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'He listened to God whenever God called him', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'He was the first prophet', false);

-- Question 7
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Why is Mary called the perfect embodiment of faith?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'She was sinless by nature', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'She performed miracles', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'She agreed to give birth to God''s Son', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'She taught the apostles', false);

-- Question 8
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Why is faith not simply a leap?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'It requires no thought', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'God forces belief', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Abraham and Mary made informed decisions', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Faith is automatic', false);

-- Question 9
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'What helped both Abraham and Mary make faithful decisions?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Signs in nature', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Dreams', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Angels', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Other people', false);

-- Question 10
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Which term refers to opinions?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Natural law', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Objective truth', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Subjective truth', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Divine truth', false);

-- Question 11
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Which term refers to real truth that can be proven?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Subjective', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Objective', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Emotional', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Cultural', false);

-- Question 12
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Which should guide our conscience?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Popular belief', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Personal feelings', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Objective truth', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Subjective opinion', false);

-- Question 13
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Which statement best reflects natural law?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Laws made by governments', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Rules of religion only', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'We should love everyone', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Whatever feels right', false);

-- Question 14
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Wanting what is best for all people is an example of:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Subjective truth', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Natural law', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Opinion', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Cultural belief', false);

-- Question 15
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The Bible is divinely inspired, meaning:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Humans wrote it alone', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'God is the real inspiration', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'It contains only history', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'It is symbolic only', false);

-- Question 16
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The word Testament means:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Promise', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Law', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Evidence', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Covenant', false);

-- Question 17
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Which books belong to the Old Testament?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Gospels and Acts', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Laws, History, Wisdom, Prophecy', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Letters and Revelation', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Psalms only', false);

-- Question 18
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Which books belong to the New Testament?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Laws and Prophets', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Wisdom books', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Gospels, Acts, Epistles, Revelation', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Psalms and Proverbs', false);

-- Question 19
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The heart of Scripture is:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Old Testament', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Psalms', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Gospels', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Epistles', false);

-- Question 20
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The word Gospel means:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Teaching', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Law', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Good News', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Truth', false);

-- Question 21
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The Good News refers to:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Creation', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Ten Commandments', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'God''s mercy and love revealed in Christ''s life, death, and resurrection', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Church history', false);

-- Question 22
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'An Apostle is:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A writer', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'One who is sent', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A teacher', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A prophet', false);

-- Question 23
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'An Evangelist is:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Any preacher', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A missionary', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'One of the four Gospel authors', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'An apostle only', false);

-- Question 24
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Which Gospels are Synoptic?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Matthew, Luke, John', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Mark, Luke, John', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Matthew, Mark, Luke', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Mark, John, Luke', false);

-- Question 25
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The word Synoptic means:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Written first', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Spirit-filled', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'To see together', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Inspired', false);

-- Question 26
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Why are the Synoptic Gospels called that?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'They were written last', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'They share similar viewpoints and stories', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'They focus on theology only', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'They were written by apostles only', false);

-- Question 27
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'John''s Gospel is different because it:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Is shorter', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Is less inspired', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Focuses on deeper theological meaning', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Was written first', false);

-- Question 28
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Matthew was traditionally a:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Fisherman', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Physician', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Tax collector', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Soldier', false);

-- Question 29
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Matthew''s primary audience was:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Gentile Christians', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Roman officials', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Jewish Christians', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Greek philosophers', false);

-- Question 30
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Matthew emphasizes Jesus as:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A philosopher', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A healer', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Fulfilling Jewish expectations of the Messiah', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A political leader', false);

-- Question 31
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Matthew focuses on fulfillment of the:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Mosaic Covenant', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Abrahamic Covenant', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Davidic Covenant', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'New Covenant', false);

-- Question 32
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'One unique feature of Matthew''s Gospel is that it:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Includes infancy narratives', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Records Jesus speaking without interruptions', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Is the shortest Gospel', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Focuses on actions over words', false);

-- Question 33
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Matthew helps answer which two questions?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'How Jesus rose and ascended', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'How the Church claims Israel and includes Gentiles', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'How miracles happened', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'How Rome influenced Christianity', false);

-- Question 34
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Luke was traditionally a:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Tax collector', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Fisherman', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Physician', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Pharisee', false);

-- Question 35
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Luke likely used which source?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Peter', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Paul only', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Mary, Jesus'' mother', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Matthew', false);

-- Question 36
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Luke''s audience was primarily:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Jewish Christians', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Roman soldiers', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Gentile Christians', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Pharisees', false);

-- Question 37
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Luke emphasizes:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Jewish law', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Jesus'' ministry to all nations', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Political change', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Apocalyptic visions', false);

-- Question 38
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Luke teaches that Gentiles:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Must convert to Judaism first', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Cannot follow Christ', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Must follow the Law', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Do not need to become Jewish to believe', true);

-- Question 39
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Luke also wrote:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Revelation', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Hebrews', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Acts of the Apostles', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Romans', false);

-- Question 40
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Mark was written around:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), '30 AD', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), '50 AD', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), '67 AD', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), '100 AD', false);

-- Question 41
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Mark was a companion of:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Matthew and Luke', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Paul and Peter', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'James and John', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Andrew and Philip', false);

-- Question 42
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Mark''s Gospel is:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The longest', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The most theological', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The shortest', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The most symbolic', false);

-- Question 43
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Mark focuses more on:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'What Jesus said', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'What Jesus did', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Infancy narratives', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Parables only', false);

-- Question 44
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Mark presents Jesus as:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The New Adam', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The New David', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The New Moses', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The New Solomon', false);

-- Question 45
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'John''s Gospel was written:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'First', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Second', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Third', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Last', true);

-- Question 46
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'John focuses primarily on:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Chronological events', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Political history', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Spiritual realities', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Jewish law', false);

-- Question 47
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'John presents Jesus as:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A prophet only', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A teacher', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Incarnate Word of God', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A reformer', false);

-- Question 48
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'John begins his Gospel with:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Resurrection', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Baptism', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Incarnation', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Ascension', false);

-- Question 49
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The Incarnation means:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Jesus teaching', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Word became flesh', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Jesus performing miracles', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Jesus rising from the dead', false);

-- Question 50
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'One purpose of John''s Gospel is to:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Teach parables', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Combat false ideas about Jesus'' humanity and divinity', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Record miracles only', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Explain Jewish law', false);

-- Question 51
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Why did the Incarnation happen?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'To show power', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'To judge humanity', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'To reconcile God and humanity', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'To establish laws', false);

-- Question 52
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Jesus became man to:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Eliminate suffering', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Prove His love', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'End history', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Replace Scripture', false);

-- Question 53
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'Jesus became man so humans could:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Become angels', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Be free from choice', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Become partakers in divine nature', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Avoid death', false);

-- Question 54
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The Immaculate Conception refers to:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Jesus'' birth', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Mary giving birth', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Mary being conceived without sin', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Jesus'' resurrection', false);

-- Question 55
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The Literal sense of Scripture means:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Symbolic meaning', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Moral lesson', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'How it is written', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'End-times meaning', false);

-- Question 56
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The Allegorical sense teaches:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'History', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Moral behavior', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Faith truths about Christ', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Future events', false);

-- Question 57
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The Moral sense shows:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Church history', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'How to apply Scripture to our lives', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'End of time', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Creation stories', false);

-- Question 58
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'The Anagogical sense refers to:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Past events', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Moral lessons', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'End times and heaven', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Laws', false);

-- Question 59
INSERT INTO questions (quiz_id, question_text) VALUES (currval('quizzes_id_seq'), 'John 17:23 relates to the end times because:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'It predicts war', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'It promises heaven', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'It explains creation', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'It explains law', false);
