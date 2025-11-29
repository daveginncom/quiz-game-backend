-- Insert British America Quiz
INSERT INTO quizzes (id, title) VALUES (1, 'British America');

-- Insert questions
INSERT INTO questions (quiz_id, question_text, question_order) VALUES
(1, 'Who was the bridge between the Powhatan and Jamestown?', 1),
(1, 'What was the first successful British colony in North America?', 2),
(1, 'What was the Puritan name for their church?', 3),
(1, 'Who founded Rhode Island after dissenting from the Puritan rulers of Massachusetts?', 4),
(1, 'Which English King was beheaded following the English Civil War?', 5),
(1, 'Who was the first woman accused of witchcraft in Salem?', 6),
(1, 'Who was the Native American Chief who allied the Wampanoag to the Pilgrims?', 7),
(1, 'Who was the family who founded and controlled Maryland?', 8),
(1, 'Which group of Puritans argued for full separation from England and the Anglican Church?', 9),
(1, 'Thomas Hooker broke with the Puritans over his belief in what?', 10),
(1, 'Which English company held a monopoly on the slave trade?', 11),
(1, 'What conflict in England saw Parliament supremacy established and reduced the monarchy to a figurehead?', 12),
(1, 'John Sossamon''s mysterious death sparked which major settler-native conflict?', 13),
(1, 'Who introduced tobacco to North America?', 14),
(1, 'Who outlined the ideas of moral and natural liberty for Puritans?', 15),
(1, 'What was the name of the promise made by Puritan ministers trying to bring people back to church?', 16),
(1, 'What document was the foundation of ideas of English liberty?', 17),
(1, 'Which rebel leader overthrew Sir Edmund Andros and seized control of New York?', 18),
(1, 'Pennsylvania treated natives well until which incident soured relations?', 19),
(1, 'The House of Burgesses was the first what in Colonial America?', 20),
(1, 'The Mayflower Compact established what idea in Colonial America?', 21),
(1, 'What was the name of the general assembly in Massachusetts?', 22),
(1, 'Which group was established by England to manage colonial affairs?', 23),
(1, 'Which rebellion pushed Virginia to become a slave society?', 24),
(1, 'What conflict in New England saw the total destruction of one of its most powerful tribes?', 25),
(1, 'What event shifted the balance of power between natives and settlers in Virginia?', 26),
(1, 'Who was the Puritan ruler of England following the English Civil War?', 27),
(1, 'The Sovereignty and Goodness of God by Mary Rowlandson is the most famous example of what kind of story?', 28),
(1, 'Which English group was the first to argue for a written constitution?', 29),
(1, 'Which was the only New England colony that did not have their charter restored after William of Orange came to the throne?', 30),
(1, 'The Quakers were descended from which major Puritan dissenter''s followers?', 31);

-- Insert choices for question 1
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(1, 'Pocahontas', TRUE, 1),
(1, 'Sacagawea', FALSE, 2),
(1, 'Anne Hutchinson', FALSE, 3),
(1, 'Deborah Sampson', FALSE, 4);

-- Insert choices for question 2
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(2, 'Jamestown', TRUE, 1),
(2, 'Roanoke', FALSE, 2),
(2, 'Plymouth', FALSE, 3),
(2, 'Quebec', FALSE, 4);

-- Insert choices for question 3
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(3, 'The Congregationalist Church', TRUE, 1),
(3, 'The Anglican Church', FALSE, 2),
(3, 'The Presbyterian Church', FALSE, 3),
(3, 'The Quaker Meetinghouse', FALSE, 4);

-- Insert choices for question 4
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(4, 'Roger Williams', TRUE, 1),
(4, 'John Winthrop', FALSE, 2),
(4, 'William Bradford', FALSE, 3),
(4, 'Thomas Hooker', FALSE, 4);

-- Insert choices for question 5
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(5, 'Charles I', TRUE, 1),
(5, 'James II', FALSE, 2),
(5, 'George I', FALSE, 3),
(5, 'Henry VIII', FALSE, 4);

-- Insert choices for question 6
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(6, 'Tituba', TRUE, 1),
(6, 'Sarah Good', FALSE, 2),
(6, 'Bridget Bishop', FALSE, 3),
(6, 'Ann Putnam', FALSE, 4);

-- Insert choices for question 7
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(7, 'Massasoit', TRUE, 1),
(7, 'Metacom', FALSE, 2),
(7, 'Powhatan', FALSE, 3),
(7, 'Sachem Uncas', FALSE, 4);

-- Insert choices for question 8
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(8, 'The Calverts', TRUE, 1),
(8, 'The Penns', FALSE, 2),
(8, 'The Winthrops', FALSE, 3),
(8, 'The Lees', FALSE, 4);

-- Insert choices for question 9
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(9, 'Pilgrims', TRUE, 1),
(9, 'Levellers', FALSE, 2),
(9, 'Quakers', FALSE, 3),
(9, 'Congregationalists', FALSE, 4);

-- Insert choices for question 10
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(10, 'Full Male Suffrage', TRUE, 1),
(10, 'Religious Tolerance', FALSE, 2),
(10, 'Church-State Separation', FALSE, 3),
(10, 'Pacifism', FALSE, 4);

-- Insert choices for question 11
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(11, 'The Royal African Company', TRUE, 1),
(11, 'The East India Company', FALSE, 2),
(11, 'The Hudson''s Bay Company', FALSE, 3),
(11, 'The Virginia Company', FALSE, 4);

-- Insert choices for question 12
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(12, 'The Glorious Revolution', TRUE, 1),
(12, 'The English Civil War', FALSE, 2),
(12, 'The Reformation Crisis', FALSE, 3),
(12, 'The Restoration', FALSE, 4);

-- Insert choices for question 13
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(13, 'King Philip''s War', TRUE, 1),
(13, 'The Pequot War', FALSE, 2),
(13, 'Pontiac''s Rebellion', FALSE, 3),
(13, 'The Yamasee War', FALSE, 4);

-- Insert choices for question 14
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(14, 'John Rolfe', TRUE, 1),
(14, 'Sir Walter Raleigh', FALSE, 2),
(14, 'William Bradford', FALSE, 3),
(14, 'Francis Drake', FALSE, 4);

-- Insert choices for question 15
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(15, 'John Winthrop', TRUE, 1),
(15, 'Roger Williams', FALSE, 2),
(15, 'Cotton Mather', FALSE, 3),
(15, 'Jonathan Edwards', FALSE, 4);

-- Insert choices for question 16
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(16, 'The Half-Way Covenant', TRUE, 1),
(16, 'The Great Awakening', FALSE, 2),
(16, 'The Toleration Act', FALSE, 3),
(16, 'The New Light Agreement', FALSE, 4);

-- Insert choices for question 17
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(17, 'The Magna Carta', TRUE, 1),
(17, 'The English Bill of Rights', FALSE, 2),
(17, 'The Petition of Right', FALSE, 3),
(17, 'The Mayflower Compact', FALSE, 4);

-- Insert choices for question 18
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(18, 'Jacob Leisler', TRUE, 1),
(18, 'Nathaniel Bacon', FALSE, 2),
(18, 'Peter Stuyvesant', FALSE, 3),
(18, 'Edmund Morgan', FALSE, 4);

-- Insert choices for question 19
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(19, 'The Walking Purchase', TRUE, 1),
(19, 'Pontiac''s Rebellion', FALSE, 2),
(19, 'The Paxton Boys Riot', FALSE, 3),
(19, 'The Alienation Act', FALSE, 4);

-- Insert choices for question 20
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(20, 'Elected Assembly', TRUE, 1),
(20, 'Tax Court', FALSE, 2),
(20, 'Royal Colony Council', FALSE, 3),
(20, 'Trade Board', FALSE, 4);

-- Insert choices for question 21
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(21, 'Self Government', TRUE, 1),
(21, 'Religious Freedom', FALSE, 2),
(21, 'Trial by Jury', FALSE, 3),
(21, 'Separation of Powers', FALSE, 4);

-- Insert choices for question 22
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(22, 'The General Court', TRUE, 1),
(22, 'The Burgesses Council', FALSE, 2),
(22, 'The Colonial Congress', FALSE, 3),
(22, 'The Royal Assembly', FALSE, 4);

-- Insert choices for question 23
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(23, 'The Lords of Trade', TRUE, 1),
(23, 'The Privy Council', FALSE, 2),
(23, 'The Board of Admiralty', FALSE, 3),
(23, 'The Royal Governors', FALSE, 4);

-- Insert choices for question 24
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(24, 'Bacon''s Rebellion', TRUE, 1),
(24, 'Shays'' Rebellion', FALSE, 2),
(24, 'Stono Rebellion', FALSE, 3),
(24, 'Leisler''s Rebellion', FALSE, 4);

-- Insert choices for question 25
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(25, 'The Pequot War', TRUE, 1),
(25, 'King Philip''s War', FALSE, 2),
(25, 'The Abenaki Struggle', FALSE, 3),
(25, 'The Narragansett War', FALSE, 4);

-- Insert choices for question 26
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(26, 'The Uprising of 1622', TRUE, 1),
(26, 'The Starving Time', FALSE, 2),
(26, 'Bacon''s Rebellion', FALSE, 3),
(26, 'The Treaty of Albany', FALSE, 4);

-- Insert choices for question 27
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(27, 'Oliver Cromwell', TRUE, 1),
(27, 'Charles II', FALSE, 2),
(27, 'William III', FALSE, 3),
(27, 'James I', FALSE, 4);

-- Insert choices for question 28
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(28, 'Captivity Narratives', TRUE, 1),
(28, 'Conversion Narratives', FALSE, 2),
(28, 'Exploration Journals', FALSE, 3),
(28, 'Travel Diaries', FALSE, 4);

-- Insert choices for question 29
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(29, 'The Levellers', TRUE, 1),
(29, 'The Puritans', FALSE, 2),
(29, 'The Royalists', FALSE, 3),
(29, 'The Quakers', FALSE, 4);

-- Insert choices for question 30
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(30, 'Massachusetts', TRUE, 1),
(30, 'Connecticut', FALSE, 2),
(30, 'Rhode Island', FALSE, 3),
(30, 'New Hampshire', FALSE, 4);

-- Insert choices for question 31
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(31, 'Anne Hutchinson', TRUE, 1),
(31, 'Roger Williams', FALSE, 2),
(31, 'Thomas Hooker', FALSE, 3),
(31, 'John Cotton', FALSE, 4);

-- Reset sequence to ensure future inserts work correctly
SELECT setval('quizzes_id_seq', (SELECT MAX(id) FROM quizzes));
SELECT setval('questions_id_seq', (SELECT MAX(id) FROM questions));
SELECT setval('choices_id_seq', (SELECT MAX(id) FROM choices));
