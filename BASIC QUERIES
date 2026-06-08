SELECT COUNT(*) AS total_candidates FROM result;
SELECT COUNT(*) AS total_constituencies FROM con;

SELECT
    (SELECT COUNT(*) FROM result) AS total_candidates,
    (SELECT COUNT(*) FROM con) AS total_constituencies;


-- =============================================
-- JOIN QUERIES
-- =============================================

-- Inner Join
SELECT * FROM con c
INNER JOIN result r ON c.Constituency = r.Constituency
ORDER BY EVM_Votes DESC;

-- INC candidates by EVM votes
SELECT * FROM con c
INNER JOIN result r ON c.Constituency = r.Constituency
WHERE r.Party = 'Indian National Congress'
ORDER BY r.EVM_Votes DESC;

-- Left Join
SELECT * FROM con c
LEFT JOIN result r ON c.Constituency = r.Constituency;

-- INC candidates in SC reserved seats
SELECT * FROM con c
LEFT JOIN result r ON c.Constituency = r.Constituency
WHERE r.Party = 'Indian National Congress'
AND c.Reserved = 'SC'
ORDER BY EVM_Votes DESC
LIMIT 5;

-- Full Outer Join (via UNION)
SELECT * FROM con c LEFT JOIN result r ON c.Constituency = r.Constituency
UNION
SELECT * FROM con c RIGHT JOIN result r ON c.Constituency = r.Constituency;


-- =============================================
-- SELF JOIN QUERIES
-- =============================================

-- Candidates from same party
SELECT r.Candidate AS can1, c.Candidate AS can2, r.Party
FROM result r
JOIN result c ON r.Party = c.Party AND r.Candidate <> c.Candidate;

-- Candidates in same constituency
SELECT r.Constituency, r.Candidate AS can1, c.Candidate AS can2
FROM result r
JOIN result c ON r.Constituency = c.Constituency AND r.Candidate <> c.Candidate;

-- INC victory margins
SELECT r.Constituency, r.Candidate AS winner, r.Total_Votes AS winner_votes,
       c.Candidate AS runner_up, c.Total_Votes AS runner_votes,
       (r.Total_Votes - c.Total_Votes) AS margin
FROM result r
JOIN result c ON r.Constituency = c.Constituency AND r.Total_Votes > c.Total_Votes
WHERE r.Party = 'Indian National Congress'
ORDER BY margin DESC;

-- BJP victory margins
SELECT r.Constituency, r.Candidate AS winner, r.Total_Votes AS winner_votes,
       c.Candidate AS runner_up, c.Total_Votes AS runner_votes,
       (r.Total_Votes - c.Total_Votes) AS margin
FROM result r
JOIN result c ON r.Constituency = c.Constituency AND r.Total_Votes > c.Total_Votes
WHERE r.Party = 'Bharatiya Janata Party'
ORDER BY margin DESC;


-- =============================================
-- AGGREGATION QUERIES
-- =============================================

-- Party-wise seats won
SELECT Party, COUNT(*) AS seats_won
FROM result
WHERE Win_Lost_Flag = 'Won'
GROUP BY Party
ORDER BY seats_won DESC;

-- Average vote share per party
SELECT Party, ROUND(AVG(vote_percentage), 2) AS avg_vote_pct
FROM result
GROUP BY Party
ORDER BY avg_vote_pct DESC;

-- Close contests (margin < 1000)
SELECT Constituency, MIN(Winning_votes) AS margin
FROM result
WHERE Win_Lost_Flag = 'Won'
GROUP BY Constituency
HAVING MIN(Winning_votes) < 1000;


-- =============================================
-- WINDOW FUNCTIONS
-- =============================================

-- Top candidate per constituency by votes
SELECT * FROM (
    SELECT *,
        RANK() OVER (PARTITION BY Constituency ORDER BY Total_Votes DESC) AS rnk
    FROM result
) t
WHERE rnk = 1;

-- Running total of votes per party
SELECT Candidate, Party, Total_Votes,
    SUM(Total_Votes) OVER (PARTITION BY Party ORDER BY Total_Votes DESC) AS running_total
FROM result;


-- =============================================
-- CTE
-- =============================================

-- State-wise party performance
WITH party_state AS (
    SELECT c.State_Name, r.Party, COUNT(*) AS seats
    FROM result r
    JOIN con c ON r.Constituency = c.Constituency
    WHERE r.Win_Lost_Flag = 'Won'
    GROUP BY c.State_Name, r.Party
)
SELECT * FROM party_state
ORDER BY State_Name, seats DESC;
