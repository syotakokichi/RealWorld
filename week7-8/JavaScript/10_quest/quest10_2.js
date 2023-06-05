function odd(numbers) {
  let result = [];
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 !== 0) {
      result.push(numbers[i]); // pushは配列の最後に要素を追加する
    }
  }
  return result;
}

console.log(odd([1, 2, 3, 4, 5])); // [1, 3, 5]
console.log(odd([2, 4, 6, 8])); // []