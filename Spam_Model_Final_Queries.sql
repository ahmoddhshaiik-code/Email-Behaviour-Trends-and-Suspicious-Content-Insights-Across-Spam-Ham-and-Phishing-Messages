-- create database spam_model;
-- use spam_model;

use email_spam;
-- 1. Display all email records available in the dataset
SELECT * 
FROM spam_model_messages;


-- 2. Count total number of email messages present in the dataset
SELECT COUNT(*) AS total_records
FROM spam_model_messages;

-- 3. Find how many emails belong to each original category (ham / spam / phishing)
SELECT Label, COUNT(*) AS total_count
FROM spam_model_messages
GROUP BY label;

-- 4. Count number of emails predicted under each category
SELECT predicted_label, COUNT(*) AS predicted_count
FROM spam_model_messages
GROUP BY predicted_label;

-- 5. Check how many predictions are correct and incorrect
SELECT prediction_status, COUNT(*) AS prediction_result
FROM spam_model_messages
GROUP BY prediction_status;



-- 7. Display all wrongly predicted email messages
SELECT *
FROM spam_model_messages
WHERE prediction_status='FALSE';

-- 8. Find average text length for each email category
SELECT Label, AVG(char_length) AS avg_text_length
FROM spam_model_messages
GROUP BY label;


-- 9. Show longest email messages in the dataset
SELECT *
FROM spam_model_messages
ORDER BY char_length DESC
LIMIT 5;

-- 10. Show shortest email messages in the dataset
SELECT *
FROM spam_model_messages
ORDER BY char_length ASC
LIMIT 5;

-- 11. Find emails containing the word 'free'
SELECT *
FROM spam_model_messages
WHERE cleaned_message LIKE '%free%';

-- 12. Find emails containing the word 'congratulations'
SELECT *
FROM spam_model_messages
WHERE cleaned_message LIKE '%congratulations%';

-- 13. Find emails containing the word 'win'
SELECT *
FROM spam_model_messages
WHERE cleaned_message LIKE '%win%';

-- 14. Show spam emails correctly predicted as spam
SELECT *
FROM spam_model_messages
WHERE label='spam' AND predicted_label='spam';

-- 15. Show spam emails incorrectly predicted as ham
SELECT *
FROM spam_model_messages
WHERE label='spam' AND predicted_label='ham';

-- 16. Show spam emails incorrectly predicted as phish
SELECT *
FROM spam_model_messages
WHERE label='spam' AND predicted_label='phish';

-- 17. Show ham emails correctly predicted as ham
SELECT *
FROM spam_model_messages
WHERE label='ham' AND predicted_label='ham';

-- 18. Show ham emails incorrectly predicted as spam
SELECT *
FROM spam_model_messages
WHERE label='ham' AND predicted_label='spam';

-- 19. Show ham emails incorrectly predicted as phish
SELECT *
FROM spam_model_messages
WHERE label='ham' AND predicted_label='phish';

-- 20. Show phish emails correctly predicted as phish
SELECT *
FROM spam_model_messages
WHERE label='phish' AND predicted_label='phish';

-- 21. Show phish emails incorrectly predicted as ham
SELECT *
FROM spam_model_messages
WHERE label='phish' AND predicted_label='ham';

-- 22. Show phish emails incorrectly predicted as spam
SELECT *
FROM spam_model_messages
WHERE label='phish' AND predicted_label='spam';

-- 23. Generate confusion matrix style summary between actual and predicted labels
SELECT label, predicted_label, COUNT(*) AS confusion_count
FROM spam_model_messages
GROUP BY label, predicted_label;

