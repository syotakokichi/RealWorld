document.addEventListener('DOMContentLoaded', function() {
  // (13-2) h1 タグの要素を取得
  const header = document.querySelector('h1');

  // (13-2) h1 タグのテキストを変更
  header.textContent = 'シンプルブログ';

  // フォームの要素を取得
  const form = document.getElementById('post-form');

  // (13-6) マウスがフォームの上に乗ったときのイベントリスナーを追加
  form.addEventListener('mouseover', function() {
    form.style.backgroundColor = 'yellow';
  });

  // (13-6) マウスがフォームから外れたときのイベントリスナーを追加
  form.addEventListener('mouseout', function() {
    form.style.backgroundColor = 'white';
  });

  form.addEventListener('submit', function(event) {
    // フォームのデフォルトの送信動作をキャンセル
    event.preventDefault();

    // タイトルと本文の入力値を取得
    const title = document.getElementById('title').value;
    const content = document.getElementById('content').value;

    // (13-4) #posts の div を取得
    const postsDiv = document.getElementById('posts');

    // (13-4) 新しい h2 要素を作成して、タイトルを設定
    const titleElement = document.createElement('h2');
    titleElement.textContent = title;

    // (13-4) 新しい p 要素を作成して、本文を設定
    const contentElement = document.createElement('p');
    contentElement.textContent = content;

    // (13-4) 新しい div 要素を作成して、タイトルと本文を追加
    const postDiv = document.createElement('div');
    postDiv.appendChild(titleElement);
    postDiv.appendChild(contentElement);

    // (13-4) #posts の div に新しい post を追加
    postsDiv.appendChild(postDiv);

    // (13-5) フォームの中身を空にする
    document.getElementById('title').value = '';
    document.getElementById('content').value = '';


    // (13-7)#posts の div 内の投稿数が3を超えていたら、一番古い投稿を削除
    while (postsDiv.children.length > 3) {
      postsDiv.removeChild(postsDiv.firstChild);
    }
  });
});