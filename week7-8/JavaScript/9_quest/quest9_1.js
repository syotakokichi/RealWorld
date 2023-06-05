function checkTemperature(t) {
  if (t >= 30) {
    console.log("Hot");
  } else if (t >= 15) {
    console.log("Warm");
  } else {
    console.log("Cold");
  }
}

checkTemperature(-5) // Cold 
checkTemperature(18) // Warm
checkTemperature(45) // Hot