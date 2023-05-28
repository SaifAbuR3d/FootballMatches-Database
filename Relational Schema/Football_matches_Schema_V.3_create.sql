-- tables
-- Table: Coaches
CREATE TABLE Coaches (
    coach_id varchar2(20)  NOT NULL,
    coach_name varchar2(20)  NOT NULL,
    birth_date date  NULL,
    CONSTRAINT Coaches_pk PRIMARY KEY (coach_id)
) ;

-- Table: Goals
CREATE TABLE Goals (
    goal_id varchar2(20)  NOT NULL,
    goal_minute integer  NOT NULL,
    player_id varchar2(20)  NOT NULL,
    CONSTRAINT Goals_pk PRIMARY KEY (goal_id)
) ;

-- Table: Matches
CREATE TABLE Matches (
    match_id varchar2(20)  NOT NULL,
    match_time timestamp  NOT NULL,
    stadium_id varchar2(20)  NOT NULL,
    CONSTRAINT Matches_pk PRIMARY KEY (match_id)
) ;

-- Table: Matches_Referees
CREATE TABLE Matches_Referees (
    match_id varchar2(20)  NOT NULL,
    referee_id varchar2(20)  NOT NULL,
    CONSTRAINT Matches_Referees_pk PRIMARY KEY (match_id,referee_id)
) ;

-- Table: Players
CREATE TABLE Players (
    player_id varchar2(20)  NOT NULL,
    player_name varchar2(20)  NOT NULL,
    player_position varchar2(20)  NULL,
    birth_date date  NOT NULL,
    team_id varchar2(20)  NULL,
    CONSTRAINT Players_pk PRIMARY KEY (player_id)
) ;

-- Table: Referees
CREATE TABLE Referees (
    referee_id varchar2(20)  NOT NULL,
    referee_name varchar2(20)  NOT NULL,
    referee_nationality varchar2(20)  NOT NULL,
    birth_date date  NULL,
    CONSTRAINT Referees_pk PRIMARY KEY (referee_id)
) ;

-- Table: Stadiums
CREATE TABLE Stadiums (
    stadium_id varchar2(20)  NOT NULL,
    stadium_location varchar2(20)  NOT NULL,
    stadium_name varchar2(20)  NOT NULL,
    stadium_capacity integer  NULL,
    CONSTRAINT Stadiums_pk PRIMARY KEY (stadium_id)
) ;

-- Table: Teams
CREATE TABLE Teams (
    team_id varchar2(20)  NOT NULL,
    team_name varchar2(20)  NOT NULL,
    coach_id varchar2(20) NULL,
    CONSTRAINT Teams_pk PRIMARY KEY (team_id)
) ;

-- Table: Teams_Matches
CREATE TABLE Teams_Matches (
    team_id varchar2(20)  NOT NULL,
    match_id varchar2(20)  NOT NULL,
    final_score integer  NOT NULL,
    CONSTRAINT Teams_Matches_pk PRIMARY KEY (team_id,match_id)
) ;

-- foreign keys
-- Reference: Goals_Players (table: Goals)
ALTER TABLE Goals ADD CONSTRAINT Goals_Players
    FOREIGN KEY (player_id)
    REFERENCES Players (player_id);

-- Reference: Matches_Referees_Matches (table: Matches_Referees)
ALTER TABLE Matches_Referees ADD CONSTRAINT Matches_Referees_Matches
    FOREIGN KEY (match_id)
    REFERENCES Matches (match_id);

-- Reference: Matches_Referees_Referees (table: Matches_Referees)
ALTER TABLE Matches_Referees ADD CONSTRAINT Matches_Referees_Referees
    FOREIGN KEY (referee_id)
    REFERENCES Referees (referee_id);

-- Reference: Matches_Stadiums (table: Matches)
ALTER TABLE Matches ADD CONSTRAINT Matches_Stadiums
    FOREIGN KEY (stadium_id)
    REFERENCES Stadiums (stadium_id);

-- Reference: Players_Teams (table: Players)
ALTER TABLE Players ADD CONSTRAINT Players_Teams
    FOREIGN KEY (team_id)
    REFERENCES Teams (team_id);

-- Reference: Teams_Coaches (table: Teams)
ALTER TABLE Teams ADD CONSTRAINT Teams_Coaches
    FOREIGN KEY (coach_id)
    REFERENCES Coaches (coach_id);

-- Reference: Teams_Matches_Matches (table: Teams_Matches)
ALTER TABLE Teams_Matches ADD CONSTRAINT Teams_Matches_Matches
    FOREIGN KEY (match_id)
    REFERENCES Matches (match_id);

-- Reference: Teams_Matches_Teams (table: Teams_Matches)
ALTER TABLE Teams_Matches ADD CONSTRAINT Teams_Matches_Teams
    FOREIGN KEY (team_id)
    REFERENCES Teams (team_id);


