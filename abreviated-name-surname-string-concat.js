/* If name = 'Franklin' and surname = 'Roosevelt', age = 80 then the output should be 'FfRo80' */

function solution(name, surname, age) {
  return abbrevStr(name) + abbrevStr(surname) + age;
}

function abbrevStr(str, max = 2) {
  return str.substr(0, max);
}

// Tests
solution("Franklin", "Roosevelt", 80); // FfRo80
solution("John", "Smith", 34); // JoSm34
solution("Ben", "Johnson", 45); // BeJo45
