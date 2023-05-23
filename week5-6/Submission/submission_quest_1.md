

## テーブル設計
1. チャンネル（Channel）
2. 番組枠（ProgramSlot）
3. 番組（Program）
4. ジャンル（Genre）
5. シーズン（Season）
6. エピソード（Episode）
7. 視聴数（ViewCount）

### テーブル：チャンネル

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| ID | bigint(20) |  | PRIMARY |  | YES |
| チャンネル名 | varchar(100) |  |  |  |  |

### テーブル：番組枠

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| ID | bigint(20) |  | PRIMARY |  | YES |
| チャンネルID | bigint(20) |  | INDEX |  |  |
| 時間帯 | varchar(100) |  |  |  |  |
- 外部キー制約：チャンネルID に対して、チャンネル テーブルの チャンネルID カラムから設定

### テーブル：番組

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| ID | bigint(20) |  | PRIMARY |  | YES |
| タイトル | varchar(255) |  |  |  |  |
| 番組詳細 | text | YES |  |  |  |

### テーブル：ジャンル

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| ID | bigint(20) |  | PRIMARY |  | YES |
| ジャンル名 | varchar(255) |  |  |  |  |

### テーブル：番組ジャンル

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| ID | bigint(20) |  | PRIMARY |  | YES |
| 番組ID | bigint(20) |  |  |  |  |
| ジャンルID | bigint(20) |  |  |  |  |
- 外部キー制約：番組ID に対して、番組 テーブルのID カラムから設定

- 外部キー制約：ジャンルID に対して、ジャンル テーブルの ジャンルID カラムから設定

### テーブル：シーズン

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| ID | bigint(20) |  | PRIMARY |  | YES |
| 番組ID | bigint(20) |  | INDEX |  |  |
| シーズン数 | int(11) | YES |  |  |  |
- 外部キー制約：番組ID に対して、番組 テーブルの ID カラムから設定

### テーブル：エピソード

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| ID | bigint(20) |  | PRIMARY |  | YES |
| シーズンID | bigint(20) |  | INDEX |  |  |
| エピソード数 | int(11) | YES |  |  |  |
| タイトル | varchar(255) |  |  |  |  |
| エピソード詳細 | text | YES |  |  |  |
| 動画時間 | int(11) |  |  |  |  |
| 公開日 | date |  |  |  |  |
- 外部キー制約：シーズンID に対して、シーズン テーブルの ID カラムから設定

### テーブル：視聴数

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| ID | bigint(20) |  | PRIMARY |  | YES |
| 番組枠ID | bigint(20) |  | INDEX |  |  |
| エピソードID | bigint(20) |  | INDEX |  |  |
| 視聴数 | bigint(20) |  |  | 0 |  |
- 外部キー制約：番組枠ID に対して、番組枠 テーブルの ID カラムから設定
- 外部キー制約：エピソードID に対して、エピソード テーブルの ID カラムから設定


[![Image from Gyazo](https://i.gyazo.com/3d1d2cfe747f27bb30b283317463b367.png)](https://gyazo.com/3d1d2cfe747f27bb30b283317463b367)
