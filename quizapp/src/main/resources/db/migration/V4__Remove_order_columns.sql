-- Remove ordering columns from questions and choices tables
-- The UI will handle randomization and ordering

ALTER TABLE questions DROP COLUMN question_order;
ALTER TABLE choices DROP COLUMN choice_order;
