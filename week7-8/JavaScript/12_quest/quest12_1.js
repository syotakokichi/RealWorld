function printBooks(books) {
  for (let i = 0; i < books.length; i++) {
    const book = books[i];
    console.log(`『${book.title}』${book.author}`);
  }
}

const books = [
  { title: "JavaScript入門", author: "山田太郎" },
  { title: "JavaScriptの絵本", author: "山田次郎" }
];

printBooks(books);
// 『JavaScript入門』山田太郎
// 『JavaScriptの絵本』山田次郎
