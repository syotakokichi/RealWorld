# ステップ2
1. データベースを構築
```sql
CREATE DATABASE IF NOT EXISTS TVNetwork;
USE TVNetwork;
```

2. ステップ1で設計したテーブルを構築
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

3. データを挿入
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

-- 注意：以下では今日の日付と1週間後の日付を使用します。実行時に適切な日付を設定してください。
INSERT INTO Broadcast (StartTime, EndTime, ChannelID, EpisodeID)
VALUES ('2023-05-21 09:00:00', '2023-05-21 10:00:00', 1, 1), 
       ('2023-05-21 10:00:00', '2023-05-21 11:00:00', 2, 2),
       ('2023-05-21 11:00:00', '2023-05-21 12:00:00', 3, 3),
       ('2023-05-28 09:00:00', '2023-05-28 10:00:00', 1, 4),
       ('2023-05-28 10:00:00', '2023-05-28 11:00:00', 2, 5),
       ('2023-05-28 11:00:00', '2023-05-28 12:00:00', 3, 6);

INSERT INTO ViewCount (Count, Date, EpisodeID)
VALUES (1000, '2023-05-21', 1), 
       (800, '2023-05-21', 2),
       (1200, '2023-05-21', 3),
       (950, '2023-05-21', 4),
       (1100, '2023-05-21', 5),
       (900, '2023-05-21', 6);
 ```
