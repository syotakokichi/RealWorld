function square(numbers) {
  let result = [];
  for (let i = 0; i < numbers.length; i++) {
    result.push(numbers[i] * numbers[i]);
  }
  return result;
}

console.log(square([1, 2, 3, 4, 5])); // [1, 4, 9, 16, 25]
console.log(square([2, 4, 6, 8])); // [4, 16, 36, 64]