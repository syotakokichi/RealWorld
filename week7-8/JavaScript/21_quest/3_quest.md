# **3. async/await**

async/await を使用して、asyncSort 関数を同期的に呼び出します。

以下のコードを完成させ、ソートされた配列をコンソールに出力してください。

なお、Async Function の外で実行した `console.log('同期処理');` は先に表示され、一方で Async Function 内で await 式の後に実行された `console.log(sortedNumbers);` は後に表示されることを確認してください。非同期処理を同期処理のように扱え、処理の流れが読みやすくなるのが async/await の特徴です。

```jsx
function asyncSort(numbers) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      // ここにコードを書く
    }, 2000);
  });
}

async function sortNumbers() {
  const numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
  // ここにコードを書く
  // asyncSort 関数を await を使って同期的に呼び出し、結果を sortedNumbers に入れる
  console.log(sortedNumbers); // ソートされた配列をコンソールに出力する
}

sortNumbers();
console.log('同期処理');

// 同期処理
// [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
```

指定された説明に基づき、以下のコードを提供します：

```jsx
javascriptCopy code
function asyncSort(numbers) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      try {
        const sortedNumbers = numbers.sort((a, b) => a - b);
        resolve(sortedNumbers);
      } catch (error) {
        reject(error);
      }
    }, 2000);
  });
}

async function sortNumbers() {
  const numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
  const sortedNumbers = await asyncSort(numbers);
  console.log(sortedNumbers);
}

sortNumbers();
console.log('同期処理');

```

このコードでは、asyncSort関数をawaitキーワードを使って呼び出しています。これにより、Promiseが解決された結果（この場合はソートされた配列）がsortedNumbers変数に代入されます。awaitキーワードは、Promiseが解決されるのを待つため、asyncSort関数の処理が完了するまで次の行（**`console.log(sortedNumbers)`**）へ進みません。

このため、**`console.log('同期処理')`**の出力が、非同期処理（**`asyncSort`**関数の結果の出力）よりも先に表示されます。しかし、非同期処理はasync/awaitによって同期処理のように扱われるため、コードの読みやすさと理解しやすさが大幅に向上します。
