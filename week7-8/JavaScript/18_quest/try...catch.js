function checkDivisibleByFive(num) {
  if (num % 5 === 0) {
    return true;
  } else {
    throw new Error(`${num} は5で割り切れません`);
  }
}

try {
  console.log(checkDivisibleByFive(10)); // true
  console.log(checkDivisibleByFive(14)); // これはエラーを引き起こします
} catch (error) {
  console.error(error.message);
}