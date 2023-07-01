# RealWorld

ブログプラットフォームを作る [RealWorld](https://github.com/gothinkster/realworld/tree/main) という OSS のプロジェクトがあります。

RealWorld は実世界と同じ機能を持つプラットフォームを作ることで、学習したいフレームワークの技術を習得することを目的としてたプロジェクトです。

ここでは、[RealWorld の バックエンドの API](https://realworld-docs.netlify.app/docs/specs/backend-specs/introduction) の仕様を満たす Rails API を作成します。

ステップ1は RealWorld の API の仕様を部分的に満たした API を作成します。具体的には、認証機能のない簡易バージョンの作成になります。

## ステップ1

RealWorld の API のうち、次のエンドポイントを実装します。

- [Create Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#create-article)
- [Get Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#get-article)
- [Update Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#update-article)
- [Delete Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#delete-article)

なお、Article に関わる要素のうち、認証機能及び著者、タグ、お気に入り(`favorite`) は実装はしません。
< br >認証機能のない簡易バージョンの作成になります。

## Postmanを使ったテスト

### 1. Create Article

- エンドポイント：`/api/articles`
- HTTPメソッド：POST (リソースの作成)
- リクエストボディ：

```json
{
  "article": {
    "slug": "how-to-train-your-dragon",
    "title": "How to train your dragon",
    "description": "Ever wonder how?",
    "body": "You have to believe"
  }
}
```

- HTTPステータスコード：201 (Created)
- レスポンスボディ：

```json
{
    "id": 2,
    "title": "How to train your dragon",
    "description": "Ever wonder how?",
    "body": "You have to believe",
    "slug": "how-to-train-your-dragon",
    "created_at": "2023-06-18T17:26:49.357Z",
    "updated_at": "2023-06-18T17:26:49.357Z"
}
```

### 2. Get Article

- エンドポイント：`/api/articles/:slug`
- HTTPメソッド：GET (リソースの取得)
- リクエストボディ：なし
- HTTPステータスコード：200 (OK)
- レスポンスボディ：

```json
{
    "id": 2,
    "title": "How to train your dragon",
    "description": "Ever wonder how?",
    "body": "You have to believe",
    "slug": "how-to-train-your-dragon",
    "created_at": "2023-06-18T17:26:49.357Z",
    "updated_at": "2023-06-18T17:26:49.357Z"
}
```

### 3. Update Article

- エンドポイント：`/api/articles/:slug`
- HTTPメソッド：PUT (リソースの更新)
- リクエストボディ：

```json
{
  "article": {
    "title": "Did you train your dragon?"
  }
}
```

- HTTPステータスコード：200 (OK)
- レスポンスボディ：

```json
{
    "id": 2,
    "title": "Did you train your dragon?",
    "description": "Ever wonder how?",
    "body": "You have to believe",
    "slug": "how-to-train-your-dragon",
    "created_at": "2023-06-18T17:26:49.357Z",
    "updated_at": "2023-06-18T17:26:49.357Z"
}
```

### 4. Delete Article

- エンドポイント：`/api/articles/:slug`
- HTTPメソッド：DELETE (リソースの削除)
- リクエストボディ：なし
- HTTPステータスコード：204 (No Content)
- レスポンスボディ：なし
