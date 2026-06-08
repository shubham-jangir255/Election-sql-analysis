# Election SQL Analysis 🗳️

MySQL-based analysis of Indian constituency-wise election results.

## Dataset
Two tables:
- `result` — Candidate-wise votes, party, EVM/postal votes, win/loss flag
- `con` — Constituency metadata: district, state, reservation status, Lok Sabha mapping

## SQL Concepts Covered
- INNER, LEFT, RIGHT, FULL OUTER JOIN (via UNION)
- Self-joins for candidate comparisons and victory margins
- Aggregations: COUNT, AVG, GROUP BY, HAVING
- Window Functions: RANK() OVER (PARTITION BY)
- CTEs for state-wise party performance
- Subqueries and filtered JOINs

## Key Analyses
- Party-wise seats won across states
- Top candidates by EVM votes per constituency
- INC vs BJP victory margin comparison
- Close-contest constituencies (margin < 1000)
- Reserved seat (SC/ST/General) performance breakdown

## Tools Used
- MySQL 8.0
- MySQL Workbench
