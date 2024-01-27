function solution(A, B) {
  let str = "";

  function addLetter(letter, count) {
    while (count > 0) {
      str += letter;
      count--;
    }
  }

  while (A > 0 || B > 0) {
    if (A < B) {
      addLetter("b", Math.min(B, 2));
      if (A > 0) {
        addLetter("a", 1);
        A--;
      }
      B -= 2;
    } else if (B < A) {
      addLetter("a", Math.min(A, 2));
      if (B > 0) {
        addLetter("b", 1);
        B--;
      }
      A -= 2;
    } else {
      if (A > 0) {
        addLetter("a", 1);
        A--;
      }
      if (B > 0) {
        addLetter("b", 1);
        B--;
      }
    }
  }

  console.log(str);
  return str;
}
