-- Insert Forming an American Identity Quiz
INSERT INTO quizzes (id, title) VALUES (2, '3.1 Forming an American Identity - Quiz Game');

-- Insert questions
INSERT INTO questions (quiz_id, question_text, question_order) VALUES
(2, 'Which region had the largest and oldest system of slavery by 1770?', 1),
(2, 'Rice plantations in South Carolina and Georgia relied heavily on which labor system?', 2),
(2, 'Who founded the colony of Georgia with the goal of creating a haven for the ''worthy poor''?', 3),
(2, 'What British policy in the early 1700s allowed colonies to govern themselves?', 4),
(2, 'Which newspaper, published by Benjamin Franklin, was widely considered the best edited?', 5),
(2, 'Natural law refers to the belief that:', 6),
(2, 'Which philosopher argued that people must surrender their freedoms to an absolute ruler?', 7),
(2, 'According to John Locke, people possess natural rights to:', 8),
(2, 'What major idea from Locke did Rousseau modify?', 9),
(2, 'Which Enlightenment thinker created the Encyclopedia?', 10),
(2, 'Voltaire advocated strongly for:', 11),
(2, 'Montesquieu is most famous for which political idea?', 12),
(2, 'Adam Smith argued that government should focus on:', 13),
(2, 'Which American figure was the most famous promoter of Enlightenment ideas in the colonies?', 14),
(2, 'The Great Awakening is best described as:', 15),
(2, 'Which preacher''s emotional sermons ignited the Great Awakening?', 16),
(2, 'Jonathan Edwards is famous for which sermon?', 17),
(2, 'One major outcome of the Great Awakening was:', 18),
(2, 'The French and Indian War was part of a larger global conflict known as:', 19),
(2, 'Which young Virginia militia officer helped spark the French and Indian War?', 20),
(2, 'What British leader turned the tide of the French and Indian War by outspending the enemy?', 21),
(2, 'Which battle resulted in British control of Quebec?', 22),
(2, 'The Treaty of Paris (1763) resulted in:', 23),
(2, 'Pontiac''s Rebellion occurred because:', 24),
(2, 'The Royal Proclamation of 1763 forbade colonists from:', 25),
(2, 'What major financial problem was the East India Company facing by 1773?', 26),
(2, 'Britain believed the colonies should help pay for:', 27),
(2, 'Colonists felt a growing sense of patriotism after the war because:', 28),
(2, 'What major cultural tension grew after the war?', 29),
(2, 'Which issue MOST contributed to the growing identity crisis between Britain and the colonies?', 30);

-- Insert choices for question 1
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(32, 'The Chesapeake', TRUE, 1),
(32, 'South Carolina and Georgia', FALSE, 2),
(32, 'New England', FALSE, 3),
(32, 'New York', FALSE, 4);

-- Insert choices for question 2
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(33, 'Gang labor system', FALSE, 1),
(33, 'Task system', TRUE, 2),
(33, 'Sharecropping', FALSE, 3),
(33, 'Debt bondage', FALSE, 4);

-- Insert choices for question 3
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(34, 'William Penn', FALSE, 1),
(34, 'James Oglethorpe', TRUE, 2),
(34, 'Thomas Hooker', FALSE, 3),
(34, 'Lord Baltimore', FALSE, 4);

-- Insert choices for question 4
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(35, 'Mercantilism', FALSE, 1),
(35, 'Salutary neglect', TRUE, 2),
(35, 'Imperial oversight', FALSE, 3),
(35, 'Navigation Acts enforcement', FALSE, 4);

-- Insert choices for question 5
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(36, 'Boston News-Letter', FALSE, 1),
(36, 'Virginia Gazette', FALSE, 2),
(36, 'Pennsylvania Gazette', TRUE, 3),
(36, 'New England Courant', FALSE, 4);

-- Insert choices for question 6
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(37, 'Rights are granted by the king', FALSE, 1),
(37, 'Some principles are universal and inherent in nature', TRUE, 2),
(37, 'Governments should be absolute', FALSE, 3),
(37, 'Only elected officials can create rights', FALSE, 4);

-- Insert choices for question 7
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(38, 'John Locke', FALSE, 1),
(38, 'Thomas Hobbes', TRUE, 2),
(38, 'Rousseau', FALSE, 3),
(38, 'Voltaire', FALSE, 4);

-- Insert choices for question 8
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(39, 'Life, liberty, and property', TRUE, 1),
(39, 'Life, liberty, and the pursuit of happiness', FALSE, 2),
(39, 'Speech, press, and religion', FALSE, 3),
(39, 'Trade, vote, and property', FALSE, 4);

-- Insert choices for question 9
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(40, 'Checks and balances', FALSE, 1),
(40, 'Social contract', TRUE, 2),
(40, 'Religious toleration', FALSE, 3),
(40, 'Separation of church and state', FALSE, 4);

-- Insert choices for question 10
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(41, 'Rousseau', FALSE, 1),
(41, 'Diderot', TRUE, 2),
(41, 'Newton', FALSE, 3),
(41, 'John Winthrop IV', FALSE, 4);

-- Insert choices for question 11
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(42, 'Democracy above all else', FALSE, 1),
(42, 'Freedom of religion, inquiry, and press', TRUE, 2),
(42, 'A return to medieval traditions', FALSE, 3),
(42, 'Complete separation from science', FALSE, 4);

-- Insert choices for question 12
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(43, 'Religious revivalism', FALSE, 1),
(43, 'Separation of powers', TRUE, 2),
(43, 'Economic nationalism', FALSE, 3),
(43, 'Direct democracy', FALSE, 4);

-- Insert choices for question 13
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(44, 'Controlling markets tightly', FALSE, 1),
(44, 'Defense, security, and fair courts', TRUE, 2),
(44, 'Owning all major industries', FALSE, 3),
(44, 'Funding overseas colonies directly', FALSE, 4);

-- Insert choices for question 14
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(45, 'George Whitefield', FALSE, 1),
(45, 'Benjamin Franklin', TRUE, 2),
(45, 'Jonathan Edwards', FALSE, 3),
(45, 'James Oglethorpe', FALSE, 4);

-- Insert choices for question 15
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(46, 'A scientific revolution in America', FALSE, 1),
(46, 'A wave of religious revivals across the colonies', TRUE, 2),
(46, 'A political movement for independence', FALSE, 3),
(46, 'A reform of colonial taxation', FALSE, 4);

-- Insert choices for question 16
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(47, 'Jonathan Edwards', FALSE, 1),
(47, 'George Whitefield', TRUE, 2),
(47, 'John Wesley', FALSE, 3),
(47, 'John Winthrop Jr.', FALSE, 4);

-- Insert choices for question 17
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(48, 'Common Sense', FALSE, 1),
(48, 'Sinners in the Hands of an Angry God', TRUE, 2),
(48, 'Letters to the English', FALSE, 3),
(48, 'The Social Contract', FALSE, 4);

-- Insert choices for question 18
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(49, 'Decline in church founding', FALSE, 1),
(49, 'Strengthened Puritanism', FALSE, 2),
(49, 'Creation of new religious colleges', TRUE, 3),
(49, 'Elimination of emotional preaching', FALSE, 4);

-- Insert choices for question 19
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(50, 'The Thirty Years'' War', FALSE, 1),
(50, 'The Hundred Years'' War', FALSE, 2),
(50, 'The Seven Years'' War', TRUE, 3),
(50, 'The Continental War', FALSE, 4);

-- Insert choices for question 20
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(51, 'Alexander Hamilton', FALSE, 1),
(51, 'Thomas Jefferson', FALSE, 2),
(51, 'George Washington', TRUE, 3),
(51, 'James Wolfe', FALSE, 4);

-- Insert choices for question 21
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(52, 'King George III', FALSE, 1),
(52, 'William Pitt the Elder', TRUE, 2),
(52, 'James Wolfe', FALSE, 3),
(52, 'Benjamin Franklin', FALSE, 4);

-- Insert choices for question 22
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(53, 'Battle of Saratoga', FALSE, 1),
(53, 'Battle of Fort Duquesne', FALSE, 2),
(53, 'Battle of the Plains of Abraham', TRUE, 3),
(53, 'Battle of Bunker Hill', FALSE, 4);

-- Insert choices for question 23
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(54, 'France gaining control of Canada', FALSE, 1),
(54, 'England becoming the dominant North American power', TRUE, 2),
(54, 'Spain taking control of the Ohio River Valley', FALSE, 3),
(54, 'Colonial independence', FALSE, 4);

-- Insert choices for question 24
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(55, 'Colonists illegally traded weapons to natives', FALSE, 1),
(55, 'Native lands were given away without consultation', TRUE, 2),
(55, 'The French encouraged an uprising', FALSE, 3),
(55, 'British troops abandoned frontier forts', FALSE, 4);

-- Insert choices for question 25
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(56, 'Trading with Europe', FALSE, 1),
(56, 'Moving west past the Appalachian Mountains', TRUE, 2),
(56, 'Owning slaves', FALSE, 3),
(56, 'Buying British goods', FALSE, 4);

-- Insert choices for question 26
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(57, 'A shortage of ships', FALSE, 1),
(57, 'A lack of tea suppliers', FALSE, 2),
(57, 'Massive debt and rotting surplus tea', TRUE, 3),
(57, 'Competition from Spanish tea merchants', FALSE, 4);

-- Insert choices for question 27
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(58, 'The King''s palace renovations', FALSE, 1),
(58, 'The national debt and colonial defense', TRUE, 2),
(58, 'The upkeep of Parliament', FALSE, 3),
(58, 'Wars between France and Spain only', FALSE, 4);

-- Insert choices for question 28
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(59, 'They won independence', FALSE, 1),
(59, 'They fought alongside the British army', TRUE, 2),
(59, 'They no longer relied on British goods', FALSE, 3),
(59, 'They disliked European politics', FALSE, 4);

-- Insert choices for question 29
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(60, 'Colonists felt superior to British citizens', FALSE, 1),
(60, 'Britons viewed colonists as backward and inferior', TRUE, 2),
(60, 'Colonists refused to consume British products', FALSE, 3),
(60, 'British elites demanded colonial independence', FALSE, 4);

-- Insert choices for question 30
INSERT INTO choices (question_id, choice_text, is_correct, choice_order) VALUES
(61, 'Religious differences', FALSE, 1),
(61, 'Rejection of Enlightenment ideas', FALSE, 2),
(61, 'Economic strain, cultural tension, and political disagreements', TRUE, 3),
(61, 'Desire for a monarchy in the colonies', FALSE, 4);
