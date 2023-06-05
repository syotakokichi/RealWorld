# ブラウザ環境でのデバッグができる

## 1. デバッグ

デバッグとは、プログラムの不具合(バグ)を発見・修正することです。ブラウザ上で動作する JavaScript のデバッグは、ブラウザに内蔵されている開発者向けツールを使って行うことができます。最もよく使われるのは、Google Chrome のデベロッパーツールや Firefox のデベロッパーツールです。
ブレイクポイントを設定することで、任意の場所やタイミングでコードの実行をブレイクし、その時点での変数の中身を確認したりすることができます。
デバッグの方法はブラウザによって異なります。今回はGoogle Chromeでのブレイクポイントを設定し、ブレイクする方法を確認してください。

```JavaScript
document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('post-form');

  form.addEventListener('submit', function(event) {
    event.preventDefault();

    const title = document.getElementById('title').value;
    const content = document.getElementById('content').value;

    const postsDiv = document.getElementById('posts');

    const titleElement = document.createElement('h2');
    titleElement.textContent = title;

    const contentElement = document.createElement('p');
    contentElement.textContent = content;

    const postDiv = document.createElement('div');
    postDiv.appendChild(titleElement);
    postDiv.appendChild(contentElement);

    postsDiv.appendChild(postDiv);

    document.getElementById('title').value = '';
    document.getElementById('content').value = '';
  });
});

```

ここで、フォームが送信されたときの処理の中で、何か問題が起きていると仮定してみましょう。例えば、投稿のタイトルが画面に表示されないとしましょう。その原因を探るために、ブレイクポイントを設定してデバッグを行うことができます。

以下に、Google Chromeの開発者ツールを使ってJavaScriptのデバッグを行う手順を説明します。

1. 開発者ツールを開く
    - Google Chromeで対象のウェブページを開き、右クリックして「検証」を選択します。または、キーボードショートカット `Ctrl+Shift+I`（Windows）または `Cmd+Option+I`（Mac）を使用します。
2. ソースパネルを開く
    - 開発者ツールの上部にあるタブの中から「Sources」をクリックします。
3. ブレイクポイントを設定する
    - ソースパネルの左側に表示されているファイルツリーから、デバッグしたいJavaScriptファイル（この場合、dom.js）を選択します。ファイルのコードが中央のパネルに表示されます。
    - コード内でブレイクポイントを設定したい行番号（この場合、`titleElement.textContent = title;`の行）をクリックします。行番号が青いマーカーでハイライトされ、その行でコードの実行が停止します。
4. コードの実行を開始する
    - ウェブページ上でJavaScriptコードが実行されるアクションを行います（この場合、フォームを送信する）。
    - 実行がブレイクポイントで停止すると、開発者ツールの右側のパネルに変数の値（この場合、titleとtitleElement）が表示されます。これにより、titleが正しく取得され、titleElementに正しく設定されているかを確認できます。
5. ブレイクポイントでコードの実行が停止したら、開発者ツールの右側のパネルを見てみましょう。ここには現在のスコープ内の変数とその値が表示されます。
6. 「Local」スコープのセクションを見てみましょう。これは現在の関数のスコープにある変数を表示しています。
7. ここで **`title`** と **`titleElement`** の値を確認できます。**`title`** は入力されたタイトルの文字列であるべきです。**`titleElement`** は作成した **`h2`** 要素を参照するオブジェクトで、その **`textContent`** プロパティは **`title`** と同じ値になっているはずです。

このように、開発者ツールのデバッガを使うことで、コードの動作を逐次確認し、問題を特定することができます。
