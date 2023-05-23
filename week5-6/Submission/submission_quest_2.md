# ステップ2
### 1. データベースを構築
```sql
CREATE DATABASE IF NOT EXISTS TVNetwork;
USE TVNetwork;
```

### 2. ステップ1で設計したテーブルを構築
```sql
CREATE TABLE Channel (
    ChannelID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Program (
    ProgramID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Genre VARCHAR(255) NOT NULL
);

CREATE TABLE Season (
    SeasonID INT PRIMARY KEY AUTO_INCREMENT,
    SeasonNumber INT NOT NULL,
    ProgramID INT,
    FOREIGN KEY (ProgramID) REFERENCES Program(ProgramID)
);

CREATE TABLE Episode (
    EpisodeID INT PRIMARY KEY AUTO_INCREMENT,
    EpisodeNumber INT NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    SeasonID INT,
    FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID)
);

CREATE TABLE Broadcast (
    BroadcastID INT PRIMARY KEY AUTO_INCREMENT,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    ChannelID INT,
    EpisodeID INT,
    FOREIGN KEY (ChannelID) REFERENCES Channel(ChannelID),
    FOREIGN KEY (EpisodeID) REFERENCES Episode(EpisodeID)
);

CREATE TABLE ViewCount (
    ViewCountID INT PRIMARY KEY AUTO_INCREMENT,
    Count INT NOT NULL,
    Date DATE NOT NULL,
    EpisodeID INT,
    FOREIGN KEY (EpisodeID) REFERENCES Episode(EpisodeID)
);
```

### 3. データを挿入
```sql
INSERT INTO Channel (Name)
VALUES ('Drama'), ('Comedy'), ('News');

INSERT INTO Program (Title, Genre)
VALUES ('Program 1', 'Thriller'), ('Program 2', 'Comedy'), ('Program 3', 'News');

INSERT INTO Season (SeasonNumber, ProgramID)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3);

INSERT INTO Episode (EpisodeNumber, Title, Description, SeasonID)
VALUES (1, 'Episode 1', 'Description 1', 1), 
       (2, 'Episode 2', 'Description 2', 2),
       (3, 'Episode 3', 'Description 3', 3),
       (4, 'Episode 4', 'Description 4', 4),
       (5, 'Episode 5', 'Description 5', 5),
       (6, 'Episode 6', 'Description 6', 6);

-- 以下では5/21 ~ 5/27日付を使用します。
-- Broadcastテーブルにデータを追加
INSERT INTO Broadcast (StartTime, EndTime, ChannelID, EpisodeID)
VALUES ('2023-05-21 09:00:00', '2023-05-21 10:00:00', 1, 1),
       ('2023-05-21 10:00:00', '2023-05-21 11:00:00', 1, 2),
       ('2023-05-21 11:00:00', '2023-05-21 12:00:00', 1, 3),
       ('2023-05-22 09:00:00', '2023-05-22 10:00:00', 1, 4),
       ('2023-05-22 10:00:00', '2023-05-22 11:00:00', 1, 5),
       ('2023-05-22 11:00:00', '2023-05-22 12:00:00', 1, 6),
       ('2023-05-23 09:00:00', '2023-05-23 10:00:00', 2, 1),
       ('2023-05-23 10:00:00', '2023-05-23 11:00:00', 2, 2),
       ('2023-05-23 11:00:00', '2023-05-23 12:00:00', 2, 3),
       ('2023-05-24 09:00:00', '2023-05-24 10:00:00', 2, 4),
       ('2023-05-24 10:00:00', '2023-05-24 11:00:00', 2, 5),
       ('2023-05-24 11:00:00', '2023-05-24 12:00:00', 2, 6),
       ('2023-05-25 09:00:00', '2023-05-25 10:00:00', 3, 1),
       ('2023-05-25 10:00:00', '2023-05-25 11:00:00', 3, 2),
       ('2023-05-25 11:00:00', '2023-05-25 12:00:00', 3, 3),
       ('2023-05-26 09:00:00', '2023-05-26 10:00:00', 3, 4),
       ('2023-05-26 10:00:00', '2023-05-26 11:00:00', 3, 5),
       ('2023-05-26 11:00:00', '2023-05-26 12:00:00', 3, 6),
       ('2023-05-27 09:00:00', '2023-05-27 10:00:00', 1, 1),
       ('2023-05-27 10:00:00', '2023-05-27 11:00:00', 1, 2),
       ('2023-05-27 11:00:00', '2023-05-27 12:00:00', 1, 3);

-- ViewCountテーブルにデータを追加
INSERT INTO ViewCount (Date, Count, EpisodeID)
VALUES ('2023-05-21', 5000, 1),
       ('2023-05-21', 4500, 2),
       ('2023-05-21', 6000, 3),
       ('2023-05-22', 5500, 4),
       ('2023-05-22', 5000, 5),
       ('2023-05-22', 4500, 6),
       ('2023-05-23', 6000, 1),
       ('2023-05-23', 5500, 2),
       ('2023-05-23', 5000, 3),
       ('2023-05-24', 4500, 4),
       ('2023-05-24', 6000, 5),
       ('2023-05-24', 5500, 6),
       ('2023-05-25', 5000, 1),
       ('2023-05-25', 4500, 2),
       ('2023-05-25', 6000, 3),
       ('2023-05-26', 5500, 4),
       ('2023-05-26', 5000, 5),
       ('2023-05-26', 4500, 6),
       ('2023-05-27', 6000, 1),
       ('2023-05-27', 5500, 2),
       ('2023-05-27', 5000, 3);
 ```
