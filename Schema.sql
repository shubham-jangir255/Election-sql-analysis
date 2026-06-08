CREATE DATABASE election;
USE election;

CREATE TABLE result (
    Constituency VARCHAR(50),
    Candidate VARCHAR(50),
    Party VARCHAR(50),
    EVM_Votes INT,
    Postal_Votes INT,
    Total_Votes INT,
    vote_percentage DECIMAL(5,2),
    _votes_polled INT,
    Tot_votes_by_parties INT,
    Winning_votes INT,
    Win_Lost_Flag VARCHAR(50)
);

CREATE TABLE con (
    Constituency VARCHAR(50),
    Tot_Constituency_votes_polled INT,
    Cons_vote_pct INT,
    Tot_parties_competed INT,
    District VARCHAR(50),
    Reserved VARCHAR(50),
    Lok_sabha_constituency VARCHAR(50),
    State_Name VARCHAR(50)
);
