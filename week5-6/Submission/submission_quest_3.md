## ステップ3

以下のデータを抽出するクエリを書いてください。

1. よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
```sql
SELECT E.Title, VC.Count 
FROM Episode E
JOIN ViewCount VC ON E.EpisodeID = VC.EpisodeID
ORDER BY VC.Count DESC 
LIMIT 3;
```

2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
```sql
SELECT P.Title AS ProgramTitle, S.SeasonNumber, E.EpisodeNumber, E.Title AS EpisodeTitle, VC.Count 
FROM Program P
INNER JOIN Season S ON P.ProgramID = S.ProgramID
INNER JOIN Episode E ON S.SeasonID = E.SeasonID
INNER JOIN ViewCount VC ON E.EpisodeID = VC.EpisodeID
ORDER BY VC.Count DESC 
LIMIT 3;
```

3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします
```sql
SELECT C.Name AS ChannelName, B.StartTime, B.EndTime, S.SeasonNumber, E.EpisodeNumber, E.Title AS EpisodeTitle, E.Description 
FROM Channel C
INNER JOIN Broadcast B ON C.ChannelID = B.ChannelID
INNER JOIN Episode E ON B.EpisodeID = E.EpisodeID
INNER JOIN Season S ON E.SeasonID = S.SeasonID
WHERE DATE(B.StartTime) = CURDATE();
```

4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
```sql
SELECT B.StartTime, B.EndTime, S.SeasonNumber, E.EpisodeNumber, E.Title AS EpisodeTitle, E.Description 
FROM Channel C
INNER JOIN Broadcast B ON C.ChannelID = B.ChannelID
INNER JOIN Episode E ON B.EpisodeID = E.EpisodeID
INNER JOIN Season S ON E.SeasonID = S.SeasonID
WHERE C.Name = 'Drama' AND B.StartTime BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);
```

5. (advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください
```sql
SELECT P.Title, SUM(VC.Count) AS TotalViewCount 
FROM Program P
INNER JOIN Season S ON P.ProgramID = S.ProgramID
INNER JOIN Episode E ON S.SeasonID = E.SeasonID
INNER JOIN ViewCount VC ON E.EpisodeID = VC.EpisodeID
WHERE VC.Date BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE()
GROUP BY P.ProgramID
ORDER BY TotalViewCount DESC 
LIMIT 2;
```

6. (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。
```sql
SELECT P.Genre, P.Title, AVG(VC.Count) AS AverageViewCount 
FROM Program P
INNER JOIN Season S ON P.ProgramID = S.ProgramID
INNER JOIN Episode E ON S.SeasonID = E.SeasonID
INNER JOIN ViewCount VC ON E.EpisodeID = VC.EpisodeID
GROUP BY P.ProgramID
ORDER BY P.Genre, AverageViewCount DESC;
```