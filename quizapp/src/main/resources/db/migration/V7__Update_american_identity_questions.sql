-- Delete existing questions and choices for American Identity quiz (quiz_id = 2)
-- Cascading deletes will remove associated choices
DELETE FROM questions WHERE quiz_id = 2;

-- Insert new questions for American Identity quiz
-- Question 1
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'What was the task system?');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A group labor system used in the Chesapeake', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A system where enslaved people were paid wages', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A system where enslaved people were given daily assigned jobs', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A religious labor requirement', false);

-- Question 2
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Georgia was originally founded to:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Expand slavery', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Create a military stronghold', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Provide a haven for debtors and the "worthy poor"', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Increase rice production', false);

-- Question 3
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Salutary neglect refers to Britain''s policy of:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Strictly enforcing colonial laws', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Ignoring the colonies completely', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Allowing colonies to govern themselves', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Eliminating colonial assemblies', false);

-- Question 4
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The Boston News-Letter is significant because it was:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A Loyalist newspaper', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The first continuous newspaper in the colonies', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Published by Benjamin Franklin', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Anti-British propaganda', false);

-- Question 5
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The Pennsylvania Gazette was best known for being:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The first newspaper', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Anti-Enlightenment', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Published by Benjamin Franklin', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Only read in Pennsylvania', false);

-- Question 6
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Natural law is the belief that:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Laws come from kings', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Laws are created by religion', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Some principles are universal and inherent in nature', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Laws should change constantly', false);

-- Question 7
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The Leviathan argued that:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Democracy was natural', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Absolutism was necessary for order', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'People were naturally good', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Governments should be overthrown', false);

-- Question 8
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Liberalism, as defined by John Locke, emphasized:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Absolute monarchy', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Social equality through force', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Natural rights and limited government', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Religious authority', false);

-- Question 9
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Two Treatise on Government argued that people possess:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Rights given by kings', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Rights granted by Parliament', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Natural rights like life, liberty, and property', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Rights only through religion', false);

-- Question 10
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'A social contract is best described as:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'An agreement between colonies', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A religious promise', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A mutual agreement between rulers and the people', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A military alliance', false);

-- Question 11
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The Enlightenment emphasized:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Faith over reason', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Tradition and authority', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Reason, science, and inquiry', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Obedience to the church', false);

-- Question 12
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Deism taught that:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'God controls every event', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'God created the world and then withdrew', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Religion should control government', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Bible is the only source of truth', false);

-- Question 13
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Separation of powers refers to:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Church and state unity', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Equal power for kings', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Dividing government into branches', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Colonial independence', false);

-- Question 14
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The Wealth of Nations argued that:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Governments should control markets', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Empires are necessary', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Free markets and limited government create wealth', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Slavery is essential', false);

-- Question 15
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The Great Awakening was:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A political revolution', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A religious revival movement', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'An economic reform', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A scientific movement', false);

-- Question 16
INSERT INTO questions (quiz_id, question_text) VALUES (2, '"Sinners in the Hands of an Angry God" focused on:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Reason and science', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'God''s mercy', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Fear, sin, and damnation', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Political freedom', false);

-- Question 17
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The "Great Hope" was the belief that:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Religion would control society', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Kings would rule wisely', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Reason and intellect could improve the future', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'War was inevitable', false);

-- Question 18
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The French and Indian War was primarily fought over:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Religious differences', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Control of Canada', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Trade with Spain', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Ohio Valley', true);

-- Question 19
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Fort Duquesne is significant because:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'It ended the war', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'It was captured by the Spanish', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'George Washington helped spark the war there', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'It was the site of the Treaty of Paris', false);

-- Question 20
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The Battle of the Plains of Abraham resulted in:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A French victory', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The capture of Quebec by the British', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The end of Pontiac''s Rebellion', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Colonial independence', false);

-- Question 21
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The Treaty of Paris (1763):');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Ended the American Revolution', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Gave Britain control of Canada', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Returned land to Native Americans', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Ended slavery', false);

-- Question 22
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Pontiac''s Rebellion occurred because:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Colonists wanted independence', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Britain raised taxes', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Native Americans resisted British expansion', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'France encouraged settlement', false);

-- Question 23
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The Royal Proclamation of 1763:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Encouraged western settlement', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Banned settlement west of the Appalachians', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Ended Native American resistance', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Created new colonies', false);

-- Question 24
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Britain''s major problem after the French and Indian War was:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Loss of territory', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Debt', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Weak military', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Lack of allies', false);

-- Question 25
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The East India Company was:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A colonial government', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A religious organization', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A powerful trade monopoly', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A Native alliance', false);

-- Question 26
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'India was important to Britain because it was:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A military buffer', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Uninhabited', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The "crown jewel" of the empire', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'A source of slaves', false);

-- Question 27
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'The colonial identity crisis developed because colonists:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Wanted independence immediately', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Felt ignored after fighting for Britain', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Rejected British culture', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Opposed Enlightenment ideas', false);

-- Question 28
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'James Oglethorpe is best known for:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Writing Enlightenment texts', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Leading Pontiac''s Rebellion', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Founding Georgia', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Leading British forces in Canada', false);

-- Question 29
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Thomas Hobbes believed that:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Humans could govern themselves', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Absolutism was necessary', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Democracy was natural', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Governments should be overthrown', false);

-- Question 30
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'John Locke argued that:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Kings rule by divine right', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Rights come from Parliament', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'People have natural rights', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Government should control markets', false);

-- Question 31
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Denis Diderot is most associated with:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Social Contract', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Encyclopedia', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Poor Richard''s Almanack', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Leviathan', false);

-- Question 32
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Voltaire advocated for:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Absolute monarchy', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Religious intolerance', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Freedom of religion and expression', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Military expansion', false);

-- Question 33
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Montesquieu believed liberty was best protected by:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Absolutism', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Religious authority', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Separation of powers', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Direct democracy', false);

-- Question 34
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Adam Smith is considered the father of:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Socialism', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Mercantilism', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Capitalism', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Communism', false);

-- Question 35
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Benjamin Franklin was known for:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Leading the Great Awakening', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Scientific experimentation and publishing', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Commanding troops', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Writing The Leviathan', false);

-- Question 36
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'George Whitefield helped start:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Enlightenment', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The French and Indian War', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The Great Awakening', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'The American Revolution', false);

-- Question 37
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'Jonathan Edwards used sermons to:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Promote science', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Encourage emotional religious revival', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Support British taxation', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Argue for independence', false);

-- Question 38
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'William Pitt the Elder''s strategy in the war was to:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Negotiate peace', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Use Native alliances', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Outspend the enemy', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Withdraw troops', false);

-- Question 39
INSERT INTO questions (quiz_id, question_text) VALUES (2, 'General James Wolfe is remembered for:');
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Defeating Washington', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Capturing Fort Duquesne', false);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Leading the British at Quebec', true);
INSERT INTO choices (question_id, choice_text, is_correct) VALUES (currval('questions_id_seq'), 'Writing the Treaty of Paris', false);
